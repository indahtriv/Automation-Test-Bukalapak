import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidElement;
import io.appium.java_client.remote.MobileCapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.net.MalformedURLException;
import java.net.URL;

public class main {
  public static void main(String[] args) throws MalformedURLException, InterruptedException {


    DesiredCapabilities desiredCapabilities = new DesiredCapabilities();

    desiredCapabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "10.0.94.31:5555");
    desiredCapabilities.setCapability("platformName", "android");
    desiredCapabilities.setCapability("appPackage", "com.loginmodule.learning");
    desiredCapabilities.setCapability("appActivity", ".activities.LoginActivity");

    AndroidDriver<AndroidElement> driver= new AndroidDriver<AndroidElement>(new URL("http://127.0.0.1:4723/wd/hub"),desiredCapabilities);

    mobileAutomationLoginTest loginTest = new mobileAutomationLoginTest();
    mobileAutomationRegisterTest registerTest = new mobileAutomationRegisterTest();
    mobileAutomationFailedRegisterTest failedRegisterTest = new mobileAutomationFailedRegisterTest();
    String email = "indah@gmail.com";
    String password = "indah";
    String name = "indah";
    String confirmPassword = "indah";
    String wrongConfirmPassword = "indah1";

    //positive testcase
//    registerTest.RegisterTest(driver,email,password,confirmPassword, name);
//    loginTest.LoginTest(driver,email,password);
    //negative testcase
    failedRegisterTest.FailedRegisterTest(driver,email,password,wrongConfirmPassword, name);

  }
}
