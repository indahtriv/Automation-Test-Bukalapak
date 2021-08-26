import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidElement;
import org.testng.Assert;

import java.net.MalformedURLException;

public class mobileAutomationFailedRegisterTest {

  public void FailedRegisterTest(AndroidDriver<AndroidElement> driver,
      String email,
      String password,
      String confirmPassword,
      String name) throws MalformedURLException, InterruptedException {


    MobileElement el1 =
        (MobileElement) driver.findElementById("com.loginmodule.learning:id/textViewLinkRegister");
    el1.click();
    Thread.sleep(2000);
    MobileElement el2 =
        (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextName");
    el2.sendKeys(name);
    MobileElement el3 =
        (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextEmail");
    el3.sendKeys(email);
    MobileElement el4 = (MobileElement) driver.findElementById(
        "com.loginmodule.learning:id/textInputEditTextPassword");
    el4.sendKeys(password);
    MobileElement el5 = (MobileElement) driver.findElementById(
        "com.loginmodule.learning:id/textInputEditTextConfirmPassword");
    el5.sendKeys(confirmPassword);
    MobileElement el6 =
        (MobileElement) driver.findElementById("com.loginmodule.learning:id/appCompatButtonRegister");
    el6.click();

    MobileElement el7 = (MobileElement) driver.findElementByXPath(
        "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/TextInputLayout[4]/android.widget.LinearLayout/android.widget.TextView");
    Assert.assertEquals(el7.getText(), "Password Does Not Matches");

  }
}
