package com.app.unl_project

import android.os.Bundle
import android.view.Gravity
import androidx.appcompat.app.AppCompatActivity
import com.app.unl_map_sdk.UnlMap
import com.app.unl_map_sdk.helpers.grid_controls.setGridControls
import com.app.unl_map_sdk.views.UnlMapView
import com.app.unl_map_sdk.helpers.tile_controls.enableTileSelector
import com.app.unl_map_sdk.helpers.tile_controls.setTileSelectorGravity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        UnlMap(applicationContext,getString(R.string.api_key),getString(R.string.vpm_id))
        setContentView(R.layout.activity_main)
        var unlMap=findViewById<UnlMapView>(R.id.mapView)
        unlMap.getMapAsync {
            unlMap.fm=supportFragmentManager
            unlMap.activity=this
            unlMap.enableTileSelector(true)
            unlMap.setGridControls(this,true)
            unlMap.setTileSelectorGravity(Gravity.RIGHT)
        }
    }
}