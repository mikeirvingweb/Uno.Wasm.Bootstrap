dotnet tool install dotnet-serve --version 1.10.112 --tool-path $BUILD_SOURCESDIRECTORY\build\tools
$env:PATH="$env:PATH;$BUILD_SOURCESDIRECTORY\build\tools"

$BOOTSTRAP_APP_PATH=$args[0]
$BOOTSTRAP_TEST_RUNNER_PATH=$args[1]
$env:BOOTSTRAP_TEST_RUNNER_URL=$args[2]

cd $BOOTSTRAP_APP_PATH
$serverProcess = Start-Process dotnet -ArgumentList 'serve -p 8000 -c' -NoNewWindow -PassThru

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