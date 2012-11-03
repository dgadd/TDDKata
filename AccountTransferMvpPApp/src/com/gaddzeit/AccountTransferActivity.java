package com.gaddzeit;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import com.gaddzeit.presenters.AccountTransferPresenter;
import com.gaddzeit.presenters.Presenterable;
import com.gaddzeit.utils.PresenterTypeEnum;
import com.gaddzeit.utils.ServiceLocator;
import com.gaddzeit.views.IAccountTransferView;

public class AccountTransferActivity extends Activity implements IAccountTransferView {
    /**
     * Called when the activity is first created.
     */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        final AccountTransferPresenter accountTransferPresenter = (AccountTransferPresenter) ServiceLocator.resolve(PresenterTypeEnum.AccountTransfer);
        accountTransferPresenter.setAccountTransferView(this);
        accountTransferPresenter.transferAmount();
    }

    @Override
    public double getTransferAmount() {
        return 150.0;
    }

    @Override
    public void setDisplayMessage(String message) {
        final TextView text = (TextView) findViewById(R.id.displayMessage);
        text.setText(message);
    }
}
