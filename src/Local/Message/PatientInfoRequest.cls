Class Local.Message.PatientInfoRequest Extends Ens.Request
{

/// Description
Property PatientId As %String;

/// Description
Property Facility As %String;

Property AppointmentId As %String;

Property Token As %String(MAXLEN = 5000);

Storage Default
{
<Data name="PatientInfoRequestDefaultData">
<Subscript>"PatientInfoRequest"</Subscript>
<Value name="1">
<Value>PatientId</Value>
</Value>
<Value name="2">
<Value>Facility</Value>
</Value>
<Value name="3">
<Value>AppointmentId</Value>
</Value>
<Value name="4">
<Value>Token</Value>
</Value>
</Data>
<DefaultData>PatientInfoRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
