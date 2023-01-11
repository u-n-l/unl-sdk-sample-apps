package com.app.unl_project

import android.os.Bundle
import android.view.Gravity
import androidx.appcompat.app.AppCompatActivity
import com.unl.map.sdk.UnlMap
import com.unl.map.sdk.helpers.grid_controls.setGridControls
import com.unl.map.sdk.helpers.tile_controls.enableTileSelector
import com.unl.map.sdk.helpers.tile_controls.setTileSelectorGravity
import com.unl.map.sdk.views.UnlMapView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        UnlMap(applicationContext,getString(R.string.api_key),getString(R.string.vpm_id))
        setContentView(R.layout.activity_main)
        val unlMap=findViewById<UnlMapView>(R.id.mapView)
        unlMap.getMapAsync {
            unlMap.fm=supportFragmentManager

            unlMap.activity=this

            unlMap.enableTileSelector(true)

            unlMap.setGridControls(this,true)

            unlMap.setTileSelectorGravity(Gravity.END)
        }
    }
}