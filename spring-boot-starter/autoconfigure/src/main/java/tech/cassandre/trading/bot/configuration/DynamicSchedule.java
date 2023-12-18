package tech.cassandre.trading.bot.configuration;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;
import tech.cassandre.trading.bot.schedule.TaskManager;

import javax.annotation.Resource;

@Configuration
//@Component
@EnableScheduling
@Slf4j
@RequiredArgsConstructor
@Setter
public class DynamicSchedule implements SchedulingConfigurer {

    /** Scheduler pool size. */
    private static final int SCHEDULER_POOL_SIZE = 6;

    /** Termination delay in milliseconds (10 000 ms = 10 seconds). */
    private static final int TERMINATION_DELAY_IN_MILLISECONDS = 10_000;
    /**
     * 任务管理器.
     */
    @Resource
    private TaskManager taskManager;

    @Override
    public void configureTasks(final ScheduledTaskRegistrar scheduledTaskRegistrar) {
        taskManager.getDefaultTask().forEach((task)-> {
            //任务执行线程
            Runnable runnable = task.getTaskHandle()::execute;
            //任务触发器
            Trigger trigger = triggerContext -> {
                //获取定时触发器，这里可以每次从数据库获取最新记录，更新触发器，实现定时间隔的动态调整
                CronTrigger cronTrigger = new CronTrigger(task.getCron());
                return cronTrigger.nextExecutionTime(triggerContext);
            };
            //注册任务
            scheduledTaskRegistrar.addTriggerTask(runnable, trigger);
        });
    }

    /**
     * 任務線程池.
     * @return
     */
    @Bean
    public TaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
        scheduler.setWaitForTasksToCompleteOnShutdown(true);
        scheduler.setAwaitTerminationMillis(TERMINATION_DELAY_IN_MILLISECONDS);
        scheduler.setThreadNamePrefix("cassandre-flux-");
        scheduler.setPoolSize(SCHEDULER_POOL_SIZE);
        scheduler.setErrorHandler(throwable -> {
            try {
                log.error("Error in scheduled tasks: {}", throwable.getMessage());
            } catch (Exception exception) {
                log.error("Error in scheduled tasks: {}", exception.getMessage());
            }
        });
        return scheduler;
    }
}

