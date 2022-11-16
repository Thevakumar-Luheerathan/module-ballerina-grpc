import ballerina/grpc;
import ballerina/protobuf.types.wrappers;

public const string HELLOWORLDINT_DESC = "0A1368656C6C6F576F726C64496E742E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F324F0A0A68656C6C6F576F726C6412410A0568656C6C6F121B2E676F6F676C652E70726F746F6275662E496E74333256616C75651A1B2E676F6F676C652E70726F746F6275662E496E74333256616C7565620670726F746F33";

public isolated client class helloWorldClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, HELLOWORLDINT_DESC);
    }

    isolated remote function hello(int|wrappers:ContextInt req) returns int|grpc:Error {
        map<string|string[]> headers = {};
        int message;
        if req is wrappers:ContextInt {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("helloWorld/hello", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <int>result;
    }

    isolated remote function helloContext(int|wrappers:ContextInt req) returns wrappers:ContextInt|grpc:Error {
        map<string|string[]> headers = {};
        int message;
        if req is wrappers:ContextInt {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("helloWorld/hello", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <int>result, headers: respHeaders};
    }
}

