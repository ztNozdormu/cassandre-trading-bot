package tech.cassandre.trading.bot.schedule.handle.impl;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import tech.cassandre.trading.bot.batch.CandlePeriodFlux;
import tech.cassandre.trading.bot.schedule.CurrencyPeriod;
import tech.cassandre.trading.bot.schedule.handle.TaskHandle;

import javax.annotation.PreDestroy;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * tiker Flux执行器.
 */
@Component
@Setter
@Getter
@RequiredArgsConstructor
public class CandleFluxHandle implements TaskHandle {

    /** Flux continues to run as long as enabled is set to true. */
    private final AtomicBoolean enabled = new AtomicBoolean(true);
    /** Candle stick history flux. */
    private final CandlePeriodFlux candlePeriodFlux;

    /** 当前任务执行时的 标的,周期信息. */
    private CurrencyPeriod currencyPeriod;
    /**
     * 任务执行函数.
     */
    @Override
    public void execute() {
        if (enabled.get() && candlePeriodFlux != null) {
            candlePeriodFlux.setCurrencyPeriod(currencyPeriod);
            candlePeriodFlux.update();
        }
    }

    /**
     * This method is called before the application shutdown.
     * We stop calling the flux.
     */
    @PreDestroy
    public void shutdown() {
        enabled.set(false);
    }
}
