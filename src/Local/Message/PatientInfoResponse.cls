Class Local.Message.PatientInfoResponse Extends Ens.Response
{

Property PatientId As %String;

Property Facility As %String;

Property PatientInfo As %Stream.GlobalCharacter;

Property Token As %String(MAXLEN = 5000);

Storage Default
{
<Data name="PatientInfoResponseDefaultData">
<Subscript>"PatientInfoResponse"</Subscript>
<Value name="1">
<Value>PatientId</Value>
</Value>
<Value name="2">
<Value>Facility</Value>
</Value>
<Value name="3">
<Value>PatientInfo</Value>
</Value>
<Value name="4">
<Value>Token</Value>
</Value>
</Data>
<DefaultData>PatientInfoResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
