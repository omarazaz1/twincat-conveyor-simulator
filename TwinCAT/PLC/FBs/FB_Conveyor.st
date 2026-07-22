FUNCTION_BLOCK FB_Conveyor
VAR_INPUT
    bStart         : BOOL;
    bStop          : BOOL;
    bReset         : BOOL;
    bEmergencyStop : BOOL;
    bInjectFault   : BOOL;
    bEntrySensor   : BOOL;
    bExitSensor    : BOOL;
    bResetCounter  : BOOL;
END_VAR
VAR_OUTPUT
    stStatus       : ST_ConveyorStatus;
END_VAR
VAR
    rEntrySensor   : R_TRIG;
END_VAR

IF bEmergencyStop OR bInjectFault THEN
    stStatus.bFaultActive := TRUE;
    stStatus.bMotorRunning := FALSE;
    stStatus.eState := E_MachineState.Faulted;
ELSIF bReset THEN
    stStatus.bFaultActive := FALSE;
    stStatus.bMotorRunning := FALSE;
    stStatus.eState := E_MachineState.Stopped;
ELSE
    CASE stStatus.eState OF
        E_MachineState.Stopped:
            stStatus.bMotorRunning := FALSE;
            IF bStart AND NOT stStatus.bFaultActive THEN
                stStatus.eState := E_MachineState.Starting;
            END_IF

        E_MachineState.Starting:
            stStatus.bMotorRunning := TRUE;
            stStatus.eState := E_MachineState.Running;

        E_MachineState.Running:
            stStatus.bMotorRunning := TRUE;
            IF bStop THEN
                stStatus.eState := E_MachineState.Stopping;
            END_IF

        E_MachineState.Stopping:
            stStatus.bMotorRunning := FALSE;
            stStatus.eState := E_MachineState.Stopped;

        E_MachineState.Faulted:
            stStatus.bMotorRunning := FALSE;
    ELSE
        stStatus.bMotorRunning := FALSE;
        stStatus.eState := E_MachineState.Stopped;
    END_CASE
END_IF

stStatus.bEntrySensor := bEntrySensor;
stStatus.bExitSensor := bExitSensor;

rEntrySensor(CLK := bEntrySensor);
IF rEntrySensor.Q AND stStatus.bMotorRunning THEN
    stStatus.nPartCount := stStatus.nPartCount + 1;
END_IF

IF bResetCounter THEN
    stStatus.nPartCount := 0;
END_IF
