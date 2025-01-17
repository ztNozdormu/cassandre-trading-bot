package tech.cassandre.trading.bot.schedule;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;


/**
 * 任务管理器.
 */
@Data
@RequiredArgsConstructor
public class TaskManager {
    /**
     * accountFluxHandle对象注入.
     */
    private final AccountFluxHandle accountFluxHandle;
    /**
     * tickerFluxHandle对象注入.
     */
    private final TickerFluxHandle tickerFluxHandle;
    /**
     * tradeOrderFluxHandle对象注入.
     */
    private final TradeOrderFluxHandle tradeOrderFluxHandle;
    /**
     * candleFluxHandle对象注入.
     */

    private final CandleFluxHandle candleFluxHandle;

    /**
     * 默认任务集合.
     */
    private  Set<Task> taskSet = ConcurrentHashMap.newKeySet();
    /**
     * 默认任务起始索引.
     */
    private static final int DEFAULT_INDEX = 1;

    /**
     * getDefaultTask().
     * @return Set<Task>
     */
    public Set<Task> getDefaultTask() {
        taskSet.add(new Task(DEFAULT_INDEX, "AccountFluxHandle", "0/1 * * * * ?", accountFluxHandle));
        taskSet.add(new Task(DEFAULT_INDEX + 1, "TickerFluxHandle", "0/1 * * * * ?", tickerFluxHandle));
        taskSet.add(new Task(DEFAULT_INDEX + 2, "TradeOrderFluxHandle", "0/1 * * * * ?", tradeOrderFluxHandle));
        return taskSet;
    }

    /**
     * 添加动态任务.
     * @param currencyPeriods
     */
    public void addDynamicTask(final Set<CurrencyPeriod> currencyPeriods) {
        // 周期与cron之间的转化函数 TODO
        currencyPeriods.forEach(currencyPeriod-> {
            candleFluxHandle.setCurrencyPeriod(currencyPeriod);
            taskSet.add(new Task(taskSet.size() + 1, currencyPeriod.getClass().getName(), "根据周期获取", candleFluxHandle));
        });
    }

}
