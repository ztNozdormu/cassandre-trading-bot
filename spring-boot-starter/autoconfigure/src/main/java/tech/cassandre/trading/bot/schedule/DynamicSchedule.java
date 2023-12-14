package tech.cassandre.trading.bot.schedule;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;

import java.util.Arrays;
import java.util.List;

@Configuration
@EnableScheduling
@Slf4j
public class DynamicSchedule implements SchedulingConfigurer {

    /**
     * 测试数据，实际可从数据库获取
     */
    private List<Task> tasks = Arrays.asList(
            new Task(1, "任务1", "*/30 * * * * *"),
            new Task(2, "任务2", "*/30 * * * * *"),
            new Task(3, "任务3", "*/30 * * * * *"),
            new Task(4, "任务4", "*/30 * * * * *"),
            new Task(5, "任务5", "*/30 * * * * *"),
            new Task(6, "任务6", "*/30 * * * * *"),
            new Task(7, "任务7", "*/30 * * * * *"),
            new Task(8, "任务8", "*/30 * * * * *"),
            new Task(9, "任务9", "*/30 * * * * *"),
            new Task(10, "任务10", "*/30 * * * * *")
    );

    @Override
    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        tasks.forEach(task -> {
            //任务执行线程
            Runnable runnable = () -> log.info("execute task {}", task.getId());

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

    @Data
    @AllArgsConstructor
    static class Task {
        /**
         * 主键ID
         */
        private int id;
        /**
         * 任务名称
         */
        private String name;
        /**
         * cron表达式
         */
        private String cron;
    }
}

