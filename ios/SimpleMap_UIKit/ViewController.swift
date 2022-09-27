import Mapbox
import UIKit
import Foundation
import ObjectiveC
import CoreLocation

class ViewController: UIViewController, MGLMapViewDelegate {
    @IBOutlet weak var stackView: UIStackView!
    
    var arrStyles = ["https://alpha.studio.unl.global/map_styles_vectorial.json","https://alpha.studio.unl.global/map_styles_satellite.json","https://alpha.studio.unl.global/map_styles_traffic.json","https://alpha.studio.unl.global/map_styles_terrain.json","https://alpha.studio.unl.global/map_styles_base.json"]
    var coordinates =
           [CLLocationCoordinate2D(latitude: 40.729437724412420, longitude: -74.00527954101562),
            CLLocationCoordinate2D(latitude: 40.718249486603604, longitude: -74.00725364685059),
            CLLocationCoordinate2D(latitude: 40.720656417464404, longitude: -74.00545120239258),
            CLLocationCoordinate2D(latitude: 40.718379593199494, longitude: -74.00519371032715),
            CLLocationCoordinate2D(latitude: 40.717273679029205, longitude: -74.00639533996582),
            CLLocationCoordinate2D(latitude: 40.713435363794270, longitude: -73.99841308593750),
            CLLocationCoordinate2D(latitude: 40.714150998671556, longitude: -73.99755477905273),
            CLLocationCoordinate2D(latitude: 40.716037635568070, longitude: -73.99643898010254),
            CLLocationCoordinate2D(latitude: 40.728201906826750, longitude: -73.99137496948242),
            CLLocationCoordinate2D(latitude: 40.743810548166270, longitude: -73.97961616516113),
            CLLocationCoordinate2D(latitude: 40.746671735171680, longitude: -73.98613929748535),
            CLLocationCoordinate2D(latitude: 40.735941649217736, longitude: -73.99377822875977),
            CLLocationCoordinate2D(latitude: 40.738673108048920, longitude: -73.99970054626465),
            CLLocationCoordinate2D(latitude: 40.729437724412420, longitude: -74.00527954101562)]

    var mapView: MGLMapView?
   
   override func viewDidLoad() {
        super.viewDidLoad()

//        let mapTilerKey = getMapTilerkey()
//        title = "Simple Map"
//        // construct style URL

        let styleURL = URL(string: "https://alpha.studio.unl.global/map_styles_satellite.json") //"https://api.maptiler.com/maps/streets/style.json?key=\(mapTilerKey)"
        // create the map view
        mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView?.delegate = self
        mapView?.logoView.isHidden = true
        // Set the map’s center coordinate and zoom level.
        mapView?.setCenter(CLLocationCoordinate2D(latitude: 40.729437724412420, longitude: -74.00527954101562), zoomLevel: 11, animated: false)
       mapView?.tintColor = .lightGray
       view.addSubview(mapView!)
       view.bringSubviewToFront(stackView)
       showRoute()
       addShape()
       addCircleAnnotations()
    }

    func getMapTilerkey() -> String {
        let mapTilerKey = Bundle.main.object(forInfoDictionaryKey: "MapTilerKey") as? String
        validateKey(mapTilerKey)
        return mapTilerKey!
    }
    
    func validateKey(_ mapTilerKey: String?) {
        if (mapTilerKey == nil) {
            preconditionFailure("Failed to read MapTiler key from info.plist")
        }
        let result: ComparisonResult = mapTilerKey!.compare("placeholder", options: NSString.CompareOptions.caseInsensitive, range: nil, locale: nil)
        if result == .orderedSame {
            preconditionFailure("Please enter correct MapTiler key in info.plist[MapTilerKey] property")
        }
    }
    
    func addShape() {
            let shape = MGLPolygon(coordinates: &coordinates, count: UInt(coordinates.count))
        mapView?.add(shape)
    }
    
    func showRoute() {
        let polyline = MGLPolyline(coordinates: coordinates, count: UInt(coordinates.count))
        mapView?.add(polyline)
    }
    
    func addCircleAnnotations() {
        var annotations = [MGLAnnotation]()
        for point in coordinates {
            let circle = MGLPointAnnotation()
            circle.coordinate = point
            annotations.append(circle)
        }
        self.mapView?.addAnnotations(annotations)
        if let annotations = self.mapView?.annotations {
            self.mapView?.showAnnotations(annotations, animated: false)
        }
        
    }
    @IBAction func actionMapStyles(_ sender: UIButton)
    {
        let styleURL = URL(string: arrStyles[sender.tag])
        mapView?.styleURL = styleURL
    }
    
    func mapView(_ mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat {
        return 0.5
    }
    func mapView(_ mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
        return .red
    }
    
    //MARK: - Polygon -
    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return .yellow
    }
    
    //MARK: - Polyline -
    func mapView(_ mapView: MGLMapView, lineWidthForPolylineAnnotation annotation: MGLPolyline) -> CGFloat {
        
        return 10
    }
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        let radius = Int(arc4random_uniform(20)) + 10
        let colorIndex = Int(arc4random_uniform(6))
        let color = [
            UIColor.red,
            UIColor.blue,
            UIColor.green,
            UIColor.purple,
            UIColor.magenta,
            UIColor.yellow][colorIndex]
        let identifier = "circle-\(radius)-\(color.description)"
        if let image = mapView.dequeueReusableAnnotationImage(withIdentifier: identifier) {
            return image
        } else {
            let image = circleImageWithRadius(radius: radius, color: color)
            return MGLAnnotationImage(image: image, reuseIdentifier: identifier)
        }
    }

    func circleImageWithRadius(radius: Int, color: UIColor) -> UIImage {
        let buffer = 2
        let rect = CGRect(x: 0, y: 0, width: radius * 2 + buffer, height: radius * 2 + buffer)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.withAlphaComponent(0.25).cgColor)
        context.setStrokeColor(color.withAlphaComponent(0.75).cgColor)
        context.setLineWidth(1.0)
        context.fillEllipse(in: rect.insetBy(dx: CGFloat(buffer * 2), dy: CGFloat(buffer * 2)))
        context.strokeEllipse(in: rect.insetBy(dx: CGFloat(buffer * 2), dy: CGFloat(buffer * 2)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return UIImage()}
        return UIImage(cgImage: cgImage)
    }
    
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {

        // Set the UIImage to be used for the fill pattern.
        let fillPatternImage = UIImage(named: "stripe-pattern")!

        // Add the fill pattern image to used by the style layer.
        style.setImage(fillPatternImage, forName: "stripe-pattern")

        // "mapbox://examples.0cd7imtl" is a map ID referencing a tileset containing vector data.
        // For more information, see mapbox.com/help/define-map-id/
        let source = MGLVectorTileSource(identifier: "drone-restrictions", configurationURL: URL(string: "mapbox://examples.0cd7imtl")!)
        style.addSource(source)

        // Create a style layer using the vector source.
        let layer = MGLFillStyleLayer(identifier: "drone-restrictions-style", source: source)

        // Set the source's identifier using the source name retrieved from its
        // TileJSON metadata: mapbox.com/api-documentation/maps/#retrieve-tilejson-metadata
        // You can also retrieve the source layer identifier in the Mapbox Studio layers list,
        // if your source data was added using the Mapbox Studio style editor.
        layer.sourceLayerIdentifier = "drone-restrictions-3f6lsg"

        // Set the fill pattern and opacity for the style layer. The NSExpression
        // object is a generic container for a style attribute value. In this case,
        // it is a reference to the fillPatternImage.
        layer.fillPattern = NSExpression(forConstantValue: "stripe-pattern")
        layer.fillOpacity = NSExpression(forConstantValue: 0.5)

        // Insert the pattern style layer below the layer contining city labels. If the
        // layer is not found, the style layer will be added above all other layers within the
        // Mapbox Dark style. NOTE: The "place-city-sm" layer is specific to the Mapbox Dark style.
        // Refer to the layers list in Mapbox Studio to confirm which layers are available for
        // use when working with a custom style.
        if let cityLabels = style.layer(withIdentifier: "place-city-sm") {
            style.insertLayer(layer, below: cityLabels)
        } else {
            style.addLayer(layer)
        }
    }
    
}
