import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// 创建HTTP服务器
let server = HTTPServer()

// 注册您自己的路由和请求／响应句柄
var routes = Routes()
routes.add(method: .get, uri: "/", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>My First swift web App.</title><body>Hello World</body></html>")
    response.completed()
}
)

var routes2 = Routes()
routes2.add(method: .get, uri: "/sec", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>My Section Page.</title><body>Hello Swift!</body></html>")
    response.completed()
}
)

server.serverName = "localhost"
// 将路由注册到服务器上
server.addRoutes(routes)
server.addRoutes(routes2)
// 监听8181端口
server.serverPort = 8181

do {
    // 启动HTTP服务器
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("网络出现错误：\(err) \(msg)")
}
