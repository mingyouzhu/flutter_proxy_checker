package com.example.flutter_proxy_checker;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.text.TextUtils;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MethodHandle implements MethodChannel.MethodCallHandler {
    Context mContext;
    Activity mActivity;

    public MethodHandle(Context context,Activity activity){
        mContext = context;
        mActivity = activity;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String,Object> map = new HashMap<>();
        if(call.method.equals("isEnabledProxy")){
            map.put("result",isEnabledProxy(mContext));
        }else new UnsupportedOperationException("no implemented!!!");
        result.success(map);
    }

    boolean isEnabledProxy(Context context){
        final boolean IS_ICS_OR_LATER = Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH;
        String proxyAddress;
        int proxyPort;
        if (IS_ICS_OR_LATER) {
            proxyAddress = System.getProperty("http.proxyHost");
            String portStr = System.getProperty("http.proxyPort");
            proxyPort = Integer.parseInt((portStr != null ? portStr : "-1"));
        } else {
            proxyAddress = android.net.Proxy.getHost(context);
            proxyPort = android.net.Proxy.getPort(context);
        }
        return (!TextUtils.isEmpty(proxyAddress)) && (proxyPort != -1);
    }
}
