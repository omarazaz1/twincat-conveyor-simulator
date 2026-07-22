FUNCTION_BLOCK FB_PartSimulator
VAR_INPUT
    bEnable       : BOOL;
    bMotorRunning : BOOL;
END_VAR
VAR_OUTPUT
    bEntrySensor  : BOOL;
    bExitSensor   : BOOL;
    nStep         : UINT;
END_VAR
VAR
    tonStep       : TON;
END_VAR

IF NOT bEnable OR NOT bMotorRunning THEN
    tonStep(IN := FALSE, PT := T#1S);
    bEntrySensor := FALSE;
    bExitSensor := FALSE;
    nStep := 0;
ELSE
    tonStep(IN := TRUE, PT := T#1S);

    IF tonStep.Q THEN
        tonStep(IN := FALSE, PT := T#1S);
        nStep := nStep + 1;
        IF nStep > 4 THEN
            nStep := 1;
        END_IF
    END_IF

    CASE nStep OF
        1:
            bEntrySensor := TRUE;
            bExitSensor := FALSE;
        2:
            bEntrySensor := FALSE;
            bExitSensor := FALSE;
        3:
            bEntrySensor := FALSE;
            bExitSensor := TRUE;
        4:
            bEntrySensor := FALSE;
            bExitSensor := FALSE;
    ELSE
        bEntrySensor := FALSE;
        bExitSensor := FALSE;
    END_CASE
END_IF
