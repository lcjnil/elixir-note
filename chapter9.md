# Processes

Elixir 使用了 Erlang 虚拟机 BEAM，与其他语言不一样，使用的不是操作系统的进程管理，更加轻量。

Elixir 使用 `spawn` `spawn_link` `spawn_monitor` 来创建新的进程，并且会返回进程的 pid。创建进程就是运行一个函数。

使用消息传递来进行进程中信息传送。每个进程都有一个信箱，通过 `send` 发送信息时，会将信息发送到对方的信箱中。使用 `receive` 接受信息时，会一直使用模式匹配来请求信箱，如果没有找到会一直等待下去，除非出现了匹配的消息或者超时，总体上来说还是相当简单的。

# OTP

## OTP GenServer

GenServer Protocol 定义了一系列包装好的 API，可以方便的写出一个基于状态机的 Server（当然是异步的）。支持 `call`, `cast`, `terminate` 等操作。
