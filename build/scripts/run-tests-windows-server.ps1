Set-PSDebug -Trace 1

$BOOTSTRAP_APP_PATH=$args[0]
$BOOTSTRAP_APP_EXE=$args[1]
$BOOTSTRAP_TEST_RUNNER_PATH=$args[2]
$env:BOOTSTRAP_TEST_RUNNER_URL=$args[3]

echo "BOOTSTRAP_APP_PATH=$BOOTSTRAP_APP_PATH, BOOTSTRAP_APP_EXE=$BOOTSTRAP_APP_EXE, BOOTSTRAP_TEST_RUNNER_PATH=$BOOTSTRAP_TEST_RUNNER_PATH"

cd $BOOTSTRAP_APP_PATH
$serverProcess = Start-Process $BOOTSTRAP_APP_EXE -NoNewWindow -PassThru

Try 
{
	cd $BOOTSTRAP_TEST_RUNNER_PATH
	npm install
	node app
}
Finally
{
	$serverProcess.Kill()
}