package com.example.commonlibrary.baseadapter.listener;

import android.view.View;

import com.example.commonlibrary.baseadapter.BaseRecyclerAdapter;

/**
 * Created by COOTEK on 2017/8/1.
 */

public abstract class OnSimpleItemLongClickListener implements BaseRecyclerAdapter.OnItemClickListener {
    @Override
    public void onItemClick(int position, View view) {

    }


    @Override
    public boolean onItemChildLongClick(int position, View view, int id) {
        return false;
    }

    @Override
    public void onItemChildClick(int position, View view, int id) {

    }
}
