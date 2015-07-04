*** Settings ***
Suite Setup      Run Tests    ${EMPTY}    standard_libraries/builtin/wait_until_keyword_succeeds.robot
Force Tags       regression    pybot    jybot
Resource         atest_resource.robot

*** Test Cases ***
Fail Because Timeout exceeded
    ${tc} =    Check Test Case    ${TESTNAME}
    # Cannot test exactly how many times kw is run because it depends on interpreter speed.
    Check Log Message    ${tc.kws[0].kws[0].msgs[0]}    Still 2 times to fail!    FAIL
    Should Be True    len($tc.kws[0].kws) < 4

Pass with first Try
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc.kws[0].kws[0].msgs[0]}    Used to test that variable name, not value, is shown in arguments
    Length Should Be    ${tc.kws[0].kws}    1

Pass With Some Medium Try
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc.kws[0].kws[0].msgs[0]}    Still 2 times to fail!    FAIL
    Check Log Message    ${tc.kws[0].kws[1].msgs[0]}    Still 1 times to fail!    FAIL
    Check Log Message    ${tc.kws[0].kws[2].msgs[0]}    Still 0 times to fail!    FAIL
    Length Should Be    ${tc.kws[0].kws}    4

Pass With Last Possible Try
    Check Test Case    ${TESTNAME}

Pass With Returning Value Correctly
    Check Test Case    ${TESTNAME}

Invalid Timeout Does Not Cause Uncatchable Failure
    Check Test Case    ${TESTNAME}

Invalid Retry Interval Does Not Cause Uncatchable Failure
    Check Test Case    ${TESTNAME}

Wait Until In User Keyword
    Check Test Case    ${TESTNAME}

Failing User Keyword with Wait Until
    Check Test Case    ${TESTNAME}

Passing User Keyword with Wait Until
    Check Test Case    ${TESTNAME}

Wait Until With Longer Test Timeout
    Check Test Case    ${TESTNAME}

Wait Until With Shorter Test Timeout
    Check Test Case    ${TESTNAME}

Wait Until With Longer Keyword Timeout
    Check Test Case    ${TESTNAME}

Wait Until With Shorter Keyword Timeout
    Check Test Case    ${TESTNAME}

Retry as count
    Check Test Case    ${TESTNAME}

Retry as count failing
    Check Test Case    ${TESTNAME} 1
    Check Test Case    ${TESTNAME} 2

Retry count must be integer
    Check Test Case    ${TESTNAME} 1
    Check Test Case    ${TESTNAME} 2

Retry count must be positive
    Check Test Case    ${TESTNAME} 1
    Check Test Case    ${TESTNAME} 2

Invalid Number Of Arguments Inside Wait Until Keyword Succeeds
    Check Test Case    ${TESTNAME}

Invalid Keyword Inside Wait Until Keyword Succeeds
    Check Test Case    ${TESTNAME}

Keyword Not Found Inside Wait Until Keyword Succeeds
    Check Test Case    ${TESTNAME}

Variable Values Should Not Be Visible In Keyword Arguments
    ${tc} =    Check Test Case    Pass With First Try
    Check KW Arguments    ${tc.kws[0].kws[0]}    \${HELLO}
