package vn.flextech.elearning

import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import com.vnpay.authentication.VNP_AuthenticationActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall


import io.flutter.plugin.common.MethodChannel
import org.conscrypt.Conscrypt
import java.security.Security

class MainActivity : FlutterActivity() {
    private  val  CHANNEL_PAY="e-learning-payment"
   private lateinit var channel: MethodChannel
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
//        Security.insertProviderAt(Conscrypt.newProvider(),1)
        channel= MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL_PAY)
        channel.setMethodCallHandler { call, result ->

            if(call.method=="show"){
                if (call.method == "show") {
                    this.handleShow(call)
                    result.success(null)
                } else {
                    result.notImplemented()
                }

            }
        }
    }
    private fun handleShow(@NonNull call: MethodCall) {
        val params = call.arguments as HashMap<*, *>
        val paymentUrl = params["paymentUrl"] as String
        val scheme = params["scheme"] as String
        val tmnCode = params["tmn_code"] as String
        val sandbox=params["isSandbox"]as Boolean
        val intent = Intent(this, VNP_AuthenticationActivity::class.java)
        intent.putExtra("url", paymentUrl)
        intent.putExtra("scheme", scheme)
        intent.putExtra("tmn_code", tmnCode)
        intent.putExtra("is_sandbox",sandbox)
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        VNP_AuthenticationActivity.setSdkCompletedCallback { action ->
            Log.d("hhhhhhhhhhhhhhhh",action)
            if (action == "AppBackAction") {
                channel.invokeMethod("PaymentBack", hashMapOf("resultCode" to -1))
            }
            if (action == "CallMobileBankingApp") {
                channel.invokeMethod("PaymentBack", hashMapOf("resultCode" to 10))
            }
            if (action == "WebBackAction") {
                channel.invokeMethod("PaymentBack", hashMapOf("resultCode" to 24))
            }
            if (action == "FaildBackAction") {
                channel.invokeMethod("PaymentBack", hashMapOf("resultCode" to 99))
            }
            if (action == "FailBackAction") {
                channel.invokeMethod("PaymentBack", hashMapOf("resultCode" to 99))
            }
            if (action == "SuccessBackAction") {

                channel.invokeMethod("PaymentBack", hashMapOf("resultCode" to 0))
            }

            //action == AppBackAction
            //Người dùng nhấn back từ sdk để quay lại

            //action == CallMobileBankingApp
            //Người dùng nhấn chọn thanh toán qua app thanh toán (Mobile Banking, Ví...)
            //lúc này app tích hợp sẽ cần lưu lại mã giao dịch thanh toán (vnp_TxnRef). Khi người dùng mở lại app tích hợp với cheme thì sẽ gọi kiểm tra trạng thái thanh toán của mã TxnRef đó kiểm tra xem đã thanh toán hay chưa để thực hiện nghiệp vụ kết thúc thanh toán / thông báo kết quả cho khách hàng..

            //action == WebBackAction
            //Tạo nút sự kiện cho user click từ return url của merchant chuyển hướng về URL: http://cancel.sdk.merchantbackapp
            // vnp_ResponseCode == 24 / Khách hàng hủy thanh toán.

            //action == FaildBackAction
            //Tạo nút sự kiện cho user click từ return url của merchant chuyển hướng về URL: http://fail.sdk.merchantbackapp
            // vnp_ResponseCode != 00 / Giao dịch thanh toán không thành công

            //action == SuccessBackAction
            //Tạo nút sự kiện cho user click từ return url của merchant chuyển hướng về URL: http://success.sdk.merchantbackapp
            //vnp_ResponseCode == 00) / Giao dịch thành công
        }
                applicationContext.startActivity(intent)
//        activityBinding?.activity?.startActivityForResult(intent, 99)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 99) {
            channel.invokeMethod("resultCode", resultCode)
        }
    }
}
