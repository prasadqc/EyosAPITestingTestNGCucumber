import com.aventstack.extentreports.testng.listener.ExtentITestListenerClassAdapter;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.testng.annotations.Listeners;


@CucumberOptions(
//        plugin = {"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:"},
        tags="@SmokeTest",
        glue = {"org.stepDefinitions"},
        features = {"src/test/resources/features"},
        monochrome = true,
        dryRun = false
)
@Listeners({ExtentITestListenerClassAdapter.class})
public class RunCucumberTest extends AbstractTestNGCucumberTests
{

}