FUNCTION_BLOCK FB_Conveyor
VAR_INPUT
    bStart          : BOOL;
    bStop           : BOOL;
    bReset          : BOOL;
    bEmergencyStop  : BOOL;
    bPartSensor     : BOOL;
END_VAR
VAR_OUTPUT
    bMotorRunning   : BOOL;
    bFaultActive    : BOOL;
    nPartCount      : UDINT;
    eState          : E_MachineState;
END_VAR
VAR
    rPartSensor     : R_TRIG;
END_VAR

IF bEmergencyStop THEN
    bFaultActive := TRUE;
    bMotorRunning := FALSE;
    eState := E_MachineState.Faulted;
ELSIF bReset THEN
    bFaultActive := FALSE;
    bMotorRunning := FALSE;
    nPartCount := 0;
    eState := E_MachineState.Stopped;
ELSE
    CASE eState OF
        E_MachineState.Stopped:
            bMotorRunning := FALSE;
            IF bStart AND NOT bFaultActive THEN
                bMotorRunning := TRUE;
                eState := E_MachineState.Running;
            END_IF
        E_MachineState.Running:
            bMotorRunning := TRUE;
            IF bStop THEN
                bMotorRunning := FALSE;
                eState := E_MachineState.Stopped;
            END_IF
        E_MachineState.Faulted:
            bMotorRunning := FALSE;
    ELSE
        bMotorRunning := FALSE;
        eState := E_MachineState.Stopped;
    END_CASE
END_IF

rPartSensor(CLK := bPartSensor);
IF rPartSensor.Q AND bMotorRunning THEN
    nPartCount := nPartCount + 1;
END_IF
