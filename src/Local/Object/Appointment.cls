Class Local.Object.Appointment Extends (%Persistent, %XML.Adaptor) [ DdlAllowed ]
{

/// Identifier of patient
Property PatientId As %String;

/// Facility appointment
Property Facility As %String;

/// Appointment date
Property AppointmentDate As %Date;

/// Appointment ID
Property AppointmentId As %String;

Storage Default
{
<Data name="AppointmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientId</Value>
</Value>
<Value name="3">
<Value>Facility</Value>
</Value>
<Value name="4">
<Value>AppointmentDate</Value>
</Value>
<Value name="5">
<Value>AppointmentId</Value>
</Value>
</Data>
<DataLocation>^Local.Object.AppointmentD</DataLocation>
<DefaultData>AppointmentDefaultData</DefaultData>
<IdLocation>^Local.Object.AppointmentD</IdLocation>
<IndexLocation>^Local.Object.AppointmentI</IndexLocation>
<StreamLocation>^Local.Object.AppointmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
