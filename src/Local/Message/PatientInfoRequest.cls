Class Local.Message.PatientInfoRequest Extends (Ens.Request, %XML.Adaptor)
{

/// Description
Property PatientId As %String;

/// Description
Property Facility As %String;

Property AppointmentId As %String;

Storage Default
{
<Data name="PatientInfoRequestDefaultData">
<Subscript>"PatientInfoRequest"</Subscript>
<Value name="1">
<Value>PatientId</Value>
</Value>
<Value name="2">
<Value>AppointmentId</Value>
</Value>
<Value name="3">
<Value>Facility</Value>
</Value>
</Data>
<DefaultData>PatientInfoRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
