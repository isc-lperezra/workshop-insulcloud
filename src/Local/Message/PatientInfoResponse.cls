Class Local.Message.PatientInfoResponse Extends (Ens.Request, %XML.Adaptor)
{

/// Description
Property PatientId As %String;

/// Description
Property Facility As %String;

Property PatientInfo As Local.Object.PatientInfo;

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
</Data>
<DefaultData>PatientInfoResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
