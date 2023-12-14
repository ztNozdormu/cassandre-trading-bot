package tech.cassandre.trading.bot.schedule;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 基础任务.
 */
@Data
@AllArgsConstructor
public class Task {
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