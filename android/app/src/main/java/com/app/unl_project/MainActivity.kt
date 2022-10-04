package com.app.unl_project

import android.graphics.Color
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.app.unl_map_sdk.UnlMap
import com.app.unl_map_sdk.UnlMapView
import com.mapbox.mapboxsdk.annotations.PolygonOptions
import com.mapbox.mapboxsdk.geometry.LatLng

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        UnlMap(applicationContext,getString(R.string.api_key),getString(R.string.vpm_id))
        setContentView(R.layout.activity_main)
        var unlMap=findViewById<UnlMapView>(R.id.mapView)
        unlMap.getMapAsync {
            var poly = ArrayList<LatLng>()
            poly.add(LatLng(34.126256, 74.832149))
            poly.add(LatLng(34.126505, 74.835068))
            poly.add(LatLng(34.122597, 74.836956))
            poly.add(LatLng(34.123307, 74.832536))
            it.addPolygon(PolygonOptions()
                .addAll(poly)
                .fillColor(Color.parseColor("#202020")))
        }
    }
}