package tech.cassandre.trading.bot.schedule;

import lombok.RequiredArgsConstructor;
import tech.cassandre.trading.bot.batch.TickerFlux;
import javax.annotation.PreDestroy;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * tiker Flux执行器.
 */
@RequiredArgsConstructor
public class TickerFluxHandle implements TaskHandle {

    /** Flux continues to run as long as enabled is set to true. */
    private final AtomicBoolean enabled = new AtomicBoolean(true);
    /** Ticker flux. */
    private final TickerFlux tickerFlux;

    /**
     * 任务执行函数.
     */
    @Override
    public void execute() {
        if (enabled.get() && tickerFlux != null) {
            tickerFlux.update();
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
