package occtest;


import org.jcae.opencascade.Utilities;
import org.jcae.opencascade.jni.*;

public class MakeBottle {

	public static void main(String... args) {
		makeBottle(50, 70, 30);
	}

	// http://www.algotopia.com/contents/opencascade/opencascade_basic
	// https://github.com/eryar/occQt/blob/master/occQt.cpp
	// https://occtutorials.wordpress.com/page/2/
	// http://www.pythonocc.org/wp-content/uploads/2010/03/pythonocc_parametric_modeling_tutorial.pdf
	static void makeBottle(double myWidth, double myHeight, double myThickness) {
		
		
		double[] p1=new double[]{0, 0, 0};
		double[] p2=new double[]{1, 1, 1};
		BRepPrimAPI_MakeBox makeBox=new BRepPrimAPI_MakeBox(p1, p2);
		Geom_Surface s = BRep_Tool.surface(Utilities.getFace(makeBox.shape(), 0));
		
		double[] aPnt1 = { -myWidth / 2., 0, 0 };
		double[] aPnt2 = { -myWidth / 2., -myThickness / 4., 0 };
		double[] aPnt3 = { 0, -myThickness / 2., 0 };
		double[] aPnt4 = { myWidth / 2., -myThickness / 4., 0 };
		double[] aPnt5 = { myWidth / 2., 0, 0 };

		// Profile : Define the Geometry
		Geom_TrimmedCurve anArcOfCircle = new GC_MakeArcOfCircle(aPnt2, aPnt3, aPnt4).value();
		Geom_TrimmedCurve aSegment1 = new GC_MakeSegment(aPnt1, aPnt2).value();
		Geom_TrimmedCurve aSegment2 = new GC_MakeSegment(aPnt4, aPnt5).value();
		// Profile : Define the Topology
		TopoDS_Edge anEdge1 = (TopoDS_Edge) (new BRepBuilderAPI_MakeEdge(aSegment1).shape());
		TopoDS_Edge anEdge2 = (TopoDS_Edge) (new BRepBuilderAPI_MakeEdge(anArcOfCircle).shape());
		TopoDS_Edge anEdge3 = (TopoDS_Edge) (new BRepBuilderAPI_MakeEdge(aSegment2).shape());
		TopoDS_Wire aWire = (TopoDS_Wire) (new BRepBuilderAPI_MakeWire(anEdge1, anEdge2, anEdge3).shape());

		// Complete Profile
		double[] xAxis = GP.OX;
		GP_Trsf aTrsf = new GP_Trsf();
		aTrsf.setMirror(xAxis);
		BRepBuilderAPI_Transform aBRepTrsf = new BRepBuilderAPI_Transform(aWire, aTrsf);
		TopoDS_Shape aMirroredShape = aBRepTrsf.shape();
		TopoDS_Wire aMirroredWire = (TopoDS_Wire) aMirroredShape;
		BRepBuilderAPI_MakeWire mkWire = new BRepBuilderAPI_MakeWire();
		mkWire.add(aWire);
		mkWire.add(aMirroredWire);
		TopoDS_Wire myWireProfile = mkWire.wire();
		// Body : Prism the Profile
		TopoDS_Face myFaceProfile = (TopoDS_Face) (new BRepBuilderAPI_MakeFace(myWireProfile).shape());
		double[] aPrismVec = { 0, 0, myHeight };
		TopoDS_Shape myBody = (TopoDS_Shape) (new BRepPrimAPI_MakePrism(myFaceProfile, aPrismVec).shape());
		// Body : Apply Fillets
		BRepFilletAPI_MakeFillet mkFillet = new BRepFilletAPI_MakeFillet(myBody);
		TopExp_Explorer anEdgeExplorer = new TopExp_Explorer(myBody, TopAbs_ShapeEnum.EDGE);
		while (anEdgeExplorer.more()) {
			TopoDS_Edge anEdge = (TopoDS_Edge) anEdgeExplorer.current();
			//Add edge to fillet algorithm
			mkFillet.add(myThickness / 12., anEdge);
			anEdgeExplorer.next();
		}
		myBody = mkFillet.shape();
		// Body : Add the Neck
		double[] neckLocation = { 0, 0, myHeight };
		double[] neckAxis = GP.DZ;
		double[] neckAx2 = new double[6];
		// gp_Ax2 neckAx2(neckLocation, neckAxis);
		System.arraycopy(neckLocation, 0, neckAx2, 0, 3);
		System.arraycopy(neckAxis, 0, neckAx2, 3, 3);
		double myNeckRadius = myThickness / 4.;
		double myNeckHeight = myHeight / 10.;
		BRepPrimAPI_MakeCylinder MKCylinder = new BRepPrimAPI_MakeCylinder(neckAx2, myNeckRadius, myNeckHeight);
		TopoDS_Shape myNeck = MKCylinder.shape();
		myBody = new BRepAlgoAPI_Fuse(myBody, myNeck).shape();
		// Body : Create a Hollowed Solid
		TopoDS_Face faceToRemove = null;
		double zMax = -1;
		System.out.println(Geom_Plane.class.getName());
		for (TopExp_Explorer aFaceExplorer = new TopExp_Explorer(myBody, TopAbs_ShapeEnum.FACE); aFaceExplorer.more(); aFaceExplorer.next()) {
			TopoDS_Face aFace = (TopoDS_Face) aFaceExplorer.current();
			// Check if <aFace> is the top face of the bottle's neck 
			Geom_Surface aSurface = BRep_Tool.surface(aFace);
			//aSurface.DynamicType()STANDARD_TYPE(Geom_Plane))
			//if (aSurface.DynamicType().equals(Geom_Plane.STANDARD_TYPE())) {
			if (aSurface instanceof Geom_Plane) { 
				//System.out.println(aSurface.getClass().getName() + " " + (aSurface instanceof Geom_Plane));

				//Geom_Plane aPlane = aSurface.DownCast(aSurface);
				Geom_Plane aPlane = (Geom_Plane)aSurface;
				double[] aPnt = aPlane.location();
				double aZ = aPnt[2];
				if (aZ > zMax) {
					zMax = aZ;
					faceToRemove = aFace;
				}
			}
		}
		//	    facesToRemove.Append(faceToRemove);
		TopoDS_Shape[] facesToRemove = { faceToRemove };
		myBody = new BRepOffsetAPI_MakeThickSolid(myBody, facesToRemove, -myThickness / 50, 1.e-3).shape();
		//	    // Threading : Create Surfaces
		Geom_CylindricalSurface aCyl1 = new Geom_CylindricalSurface(neckAx2, myNeckRadius * 0.99);
		Geom_CylindricalSurface aCyl2 = new Geom_CylindricalSurface(neckAx2, myNeckRadius * 1.05);
		//	    // Threading : Define 2D Curves
		double[] aPnt = { 2. * Math.PI, myNeckHeight / 2. };
		double[] aDir = { 2. * Math.PI, myNeckHeight / 4. };
		double[] anAx2d = new double[4];
		System.arraycopy(aPnt, 0, anAx2d, 0, 2);
		System.arraycopy(aDir, 0, anAx2d, 2, 2);

		double aMajor = 2. * Math.PI;
		double aMinor = myNeckHeight / 10;
		Geom2d_Ellipse anEllipse1 = new Geom2d_Ellipse(anAx2d, aMajor, aMinor); 
		Geom2d_Ellipse anEllipse2 = new Geom2d_Ellipse(anAx2d, aMajor, aMinor / 4);
		Geom2d_TrimmedCurve anArc1 = new Geom2d_TrimmedCurve(anEllipse1, 0, Math.PI); 
		Geom2d_TrimmedCurve anArc2 = new Geom2d_TrimmedCurve(anEllipse2, 0, Math.PI);
		double[] anEllipsePnt1 = anEllipse1.value(0.0); 
		double[] anEllipsePnt2 = anEllipse1.value(Math.PI);
		Geom2d_TrimmedCurve aSegment = new GCE2d_MakeSegment(anEllipsePnt1, anEllipsePnt2).value();
		//	    // Threading : Build Edges and Wires
		TopoDS_Edge anEdge1OnSurf1 = new BRepBuilderAPI_MakeEdge(anArc1, aCyl1).edge();
		TopoDS_Edge anEdge2OnSurf1 = new BRepBuilderAPI_MakeEdge(aSegment, aCyl1).edge();
		TopoDS_Edge anEdge1OnSurf2 = new BRepBuilderAPI_MakeEdge(anArc2, aCyl2).edge();
		TopoDS_Edge anEdge2OnSurf2 = new BRepBuilderAPI_MakeEdge(aSegment, aCyl2).edge();
		TopoDS_Wire threadingWire1 = new BRepBuilderAPI_MakeWire(anEdge1OnSurf1, anEdge2OnSurf1).wire();
		TopoDS_Wire threadingWire2 = new BRepBuilderAPI_MakeWire(anEdge1OnSurf2, anEdge2OnSurf2).wire();
		BRepLib.buildCurves3d(threadingWire1);
		BRepLib.buildCurves3d(threadingWire2);
		// Create Threading 
		BRepOffsetAPI_ThruSections aTool = new BRepOffsetAPI_ThruSections(true);
		aTool.addWire(threadingWire1);
		aTool.addWire(threadingWire2);
		aTool.checkCompatibility(false);
		TopoDS_Shape myThreading = aTool.shape();
		// Building the Resulting Compound 
		TopoDS_Compound aRes = new TopoDS_Compound();
		BRep_Builder aBuilder = new BRep_Builder();
		aBuilder.makeCompound(aRes);
		aBuilder.add(aRes, myBody);
		aBuilder.add(aRes, myThreading);
		//	    return aRes;
		STEPControl_Writer writer;
		try {
			BRepTools.write(aRes, "test.brep");

			STEPControl_Writer swriter = new STEPControl_Writer();
			swriter.transfer(aRes, STEPControl_StepModelType.AsIs);
			swriter.write("test.step");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}


