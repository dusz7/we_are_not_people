# we_are_not_people
as i say, we're not people


这是Arduino的程序：

* wifi_config是通过Arduino的软串口对ESP8266模块的Wi-Fi配置（通过依次输入AT指令进入透传模式）

    * 实际操作发现，这里坑蛮多的，是否成功有些玄学。
    * 如果有USB转TTL模块，直接对ESP8266进行烧写，应该会好些

* run_this为Arduino运行程序，各传感器的连接IO口见定义，可自行调整

* 注：先烧写wifi_config程序，然后断开esp8266与Arduino的RX／TX连接，烧写完run_this后再连接，重启
