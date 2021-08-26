import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidElement;
import io.appium.java_client.remote.MobileCapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.Assert;

import java.net.MalformedURLException;
import java.net.URL;

public class mobileAutomationLoginTest {
  public  void LoginTest(AndroidDriver<AndroidElement> driver, String email, String password) throws MalformedURLException, InterruptedException {

    Thread.sleep(1000);
    MobileElement el3 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextEmail");
    el3.sendKeys(email);
    MobileElement el5 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextPassword");
    el5.sendKeys(password);
    MobileElement el6 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/appCompatButtonLogin");
    el6.click();

    Thread.sleep(2000);
    MobileElement el7 = (MobileElement) driver.findElementByXPath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.TextView[1]");
    Assert.assertEquals(el7.getText(), "Android NewLine Learning" );
  }
}
