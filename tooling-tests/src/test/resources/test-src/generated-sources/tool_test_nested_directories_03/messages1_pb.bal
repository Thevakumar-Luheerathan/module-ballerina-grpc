import ballerina/protobuf;

public const string MESSAGES1_DESC = "0A0F6D65737361676573312E70726F746F221C0A084D6573736167653112100A036D736718012001280952036D7367620670726F746F33";

@protobuf:Descriptor {value: MESSAGES1_DESC}
public type Message1 record {|
    string msg = "";
|};

