
// Tencent is pleased to support the open source community by making Mars available.
// Copyright (C) 2016 THL A29 Limited, a Tencent company. All rights reserved.

// Licensed under the MIT License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://opensource.org/licenses/MIT

// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.

//
//  comm_data.h
//  comm
//
//  Created by garry on 2017/2/17.
//

#ifndef comm_data_h
#define comm_data_h

#include <stdint.h>

#include <string>

namespace mars {
namespace comm {

enum ProxyType {
    kProxyNone = 0,
    kProxyHttpTunel,
    kProxySocks5,
    kProxyHttp,
};

class ProxyInfo {
 public:
    ProxyInfo() : ProxyInfo(kProxyNone, "", "", 0, "", "") {
    }
    ProxyInfo(ProxyType _type,
              const std::string& _host,
              const std::string& _ip,
              uint16_t _port,
              const std::string& _username,
              const std::string& _password)
    : type(_type), host(_host), ip(_ip), port(_port), username(_username), password(_password) {
    }

    bool operator==(const ProxyInfo& _rh) {
        if (type != _rh.type) {
            return false;
        }
        if (kProxyNone == type) {
            return true;
        }
        return host == _rh.host && ip == _rh.ip && port == _rh.port && username == _rh.username
               && password == _rh.password;
    }

    bool IsValid() const {
        return kProxyNone == type || ((!ip.empty() || !host.empty()) && port > 0);
    }
    bool IsAddressValid() const {
        return type != kProxyNone && ((!ip.empty() || !host.empty()) && port > 0);
    }

 public:
    ProxyType type;
    std::string host;
    std::string ip;
    uint16_t port;
    std::string username;
    std::string password;
};

//
enum class BizType{CGI = 0, CDN, COUNT};
enum class ProtoType{TCP = 0, QUIC, COUNT};

struct ConnRecord{
    BizType biz = BizType::CGI;
    ProtoType proto = ProtoType::TCP;
    bool succeed = false;       //.是否连接成功.
    uint64_t begin_timestamp_ms = 0;
    unsigned cost_ms = 0;
};
inline bool operator<(const ConnRecord& lhs, const ConnRecord& rhs){
    return lhs.begin_timestamp_ms < rhs.begin_timestamp_ms;
}

}  // namespace comm
}  // namespace mars

#endif /* comm_data_h */
