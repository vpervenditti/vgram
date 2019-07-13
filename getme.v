module vgram

import http
import json

struct getMeResp {
mut:
    id int
    is_bot bool
    first_name string
    username string
}

struct resultGetMe {
mut:
    ok bool
    result getMeResp
}
pub fn (u Telegram) get_me() resultGetMe {
    resp := json.decode(resultGetMe, u.raw_request('getMe', map[string]string{})) or {
	    eprintln('Failed to decode json')
	    return resultGetMe{}
    }
    return resp
}