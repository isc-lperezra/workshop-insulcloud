Class Local.BS.GetAppointmentBS Extends Ens.BusinessService
{

Property Target As Ens.DataType.ConfigName;

Parameter SETTINGS = "Target:Basic";

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pRequest As %RegisteredObject, pResponse As %RegisteredObject) As %Status
{
    set tSC = $$$OK

    set selectAppointments = "SELECT PatientId, Facility, AppointmentId FROM Local_Object.Appointment WHERE AppointmentDate = ?"
    set statementAppointments = ##class(%SQL.Statement).%New()
    set statusAppointments = statementAppointments.%Prepare(selectAppointments)
    if ($$$ISOK(statusAppointments)) {
        set resultSetAppointments = statementAppointments.%Execute($H+1)
        if (resultSetAppointments.%SQLCODE = 0) {
            $$$TRACE($ZDT($H+1,4))
            while resultSetAppointments.%Next() {
                $$$TRACE("Consulta con resultados")
                set appointmentRequest = ##class(Local.Message.PatientInfoRequest).%New()
                set appointmentRequest.PatientId = resultSetAppointments.%GetData("PatientId")
                set appointmentRequest.Facility = resultSetAppointments.%GetData("Facility")
                set appointmentRequest.AppointmentId = resultSetAppointments.%GetData("AppointmentId")
                set tSC=..SendRequestAsync(..Target, appointmentRequest)            
            }
        }
    }

    Quit tSC
}

}
