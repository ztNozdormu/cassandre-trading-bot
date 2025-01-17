package tech.cassandre.trading.bot.schedule;

import lombok.RequiredArgsConstructor;
import tech.cassandre.trading.bot.batch.AccountFlux;
import javax.annotation.PreDestroy;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * 账号Flux执行器.
 */
@RequiredArgsConstructor
public class AccountFluxHandle implements TaskHandle {

    /** Flux continues to run as long as enabled is set to true. */
    private final AtomicBoolean enabled = new AtomicBoolean(true);
    /** Account flux. */
    private final AccountFlux accountFlux;

    /**
     * 任务执行函数.
     */
    @Override
    public void execute() {
        if (enabled.get()) {
            accountFlux.update();
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
