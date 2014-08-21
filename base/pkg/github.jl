module GitHub

import Main, ..Git, ..Dir

const AUTH_NOTE = "Julia Package Manager"
const AUTH_DATA = {
    "scopes" => ["repo"],
    "note" => AUTH_NOTE,
    "note_url" => "http://docs.julialang.org/en/latest/manual/packages/",
}

function user()
    if !success(`git config --global github.user`)
        error("""
        no GitHub user name configured; please configure it with:

            git config --global github.user USERNAME

        where USERNAME is replaced with your GitHub user name.
        """)
    end
    readchomp(`git config --global github.user`)
end

function json()
    isdefined(:JSON) || try require("JSON")
    catch err
        warn(err)
        error("using the GitHub API requires having the JSON package installed ")
    end
    Main.JSON
end

function curl(url::String, opts::Cmd=``)
    success(`curl --version`) || error("using the GitHub API requires having `curl` installed")
    out, proc = open(`curl -i -s -S $opts $url`,"r")
    head = readline(out)
    status = int(split(head,r"\s+";limit=3)[2])
    for line in eachline(out)
        ismatch(r"^\s*$",line) || continue
        wait(proc); return status, readall(out)
    end
    error("strangely formatted HTTP response")
end
curl(url::String, data::Nothing, opts::Cmd=``) = curl(url,opts)
curl(url::String, data, opts::Cmd=``) =
    curl(url,`--data $(sprint(io->json().print(io,data))) $opts`)

function delete_token()
    tokfile = Dir.path(".github","token")
    Base.rm(tokfile)
    info("Could not authenticate with existing token. Deleting token and trying again.")
end

function token(user::String=user())
    tokfile = Dir.path(".github","token")
    isfile(tokfile) && return strip(readchomp(tokfile))
    status, content = curl("https://api.github.com/authorizations",AUTH_DATA,`-u $user`)
    if status == 422
        error_code = json().parse(content)["errors"][1]["code"]
        if error_code == "already_exists"
            info("Retrieving existing GitHub token (you may have to enter you password again)")
            status,content = curl("https://api.github.com/authorizations",`-u $user`)
            (status >= 400) && error("$status: $(json().parse(content)["message"])")
            for entry in json().parse(content)
                if entry["note"] == AUTH_NOTE
                    tok = entry["token"]
                end
            end
        else
            error("GitHub returned validation error (422): $error_code")
        end
    else
        (status != 401 && status != 403) || error("$status: $(json().parse(content)["message"])")
        tok = json().parse(content)["token"]
    end
    mkpath(dirname(tokfile))
    open(io->println(io,tok),tokfile,"w")
    return tok
end

function req(resource::String, data, opts::Cmd=``)
    url = "https://api.github.com/$resource"
    status, content = curl(url,data,`-u $(token()):x-oauth-basic $opts`)
    response = json().parse(content)
    status, response
end

GET(resource::String, data, opts::Cmd=``) = req(resource,data,opts)
HEAD(resource::String, data, opts::Cmd=``) = req(resource,data,`-I $opts`)
PUT(resource::String, data, opts::Cmd=``) = req(resource,data,`-X PUT $opts`)
POST(resource::String, data, opts::Cmd=``) = req(resource,data,`-X POST $opts`)
PATCH(resource::String, data, opts::Cmd=``) = req(resource,data,`-X PATCH $opts`)
DELETE(resource::String, data, opts::Cmd=``) = req(resource,data,`-X DELETE $opts`)

for m in (:GET,:HEAD,:PUT,:POST,:PATCH,:DELETE)
    @eval $m(resource::String, opts::Cmd=``) = $m(resource,nothing,opts)
end

function pushable(owner::String, repo::String, user::String=user())
    status, response = HEAD("repos/$owner/$repo")
    status == 404 && error("repo $owner/$repo does not exist")
    status, response = GET("repos/$owner/$repo/collaborators/$user")
    status == 204 && return true
    status == 404 && return false
    error("unexpected API status code: $status – $(response["message"])")
end

function fork(owner::String, repo::String)
    status, response = POST("repos/$owner/$repo/forks")
    if status == 401
        delete_token()
        status, response = POST("repos/$owner/$repo/forks")
    end
    status == 202 || error("forking $owner/$repo failed: $(response["message"])")
    return response
end

end # module
