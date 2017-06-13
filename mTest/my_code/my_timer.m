%循环读取csi文件
read_timer=timer('TimerFcn','csi_trace=my_read_task();', 'Period', 1,'executionmode','fixeddelay',...
    'TasksToExecute',1000,'StopFcn','disp(''Timer has stopped.'')');
    
start(read_timer);







