package com.lacunalabs.dm.processing;
import com.lacunalabs.dm.shared.math.geometry.VectorType;

public class OrientationProcessors {
	/* This is a straight forward zone axix rotation matrix calculation
	 * Takes a crystal with a known beam direction and a know g-vector orientation
	 * and returns the rotation matrix.
	 * The beam direction is determined from a zone axis, a rotation about this axis.
	 * (With the g-vector started parallel to the y-axis before rotation, rotation is clockwise
	 * in the direction of the beam)
	 * The g-vector must be plane normal to the beam direction with a given rotation about
	 * the g-vector
	 */
	static public double[][] calculateRotationMatrix(UnitCellParameters uc, Orientation or){
			double[][] matrixXForm = UnitCellProcessors.calculateGet001XForm(uc);
			double[][] vForm;
			double[] xyz1;
			double[] xyz2;
			double[] uvw; 
			xyz1  = UnitCellProcessors.calculateDirectionOfPlaneNormal(uc, or.getzAspect(), or.getzVectorType());
			
			xyz1 = MatrixProcessors.TRANSFORM_VECTOR(xyz1, matrixXForm);
			double[][] newMatrix = MatrixProcessors.FIND_CENTER_XFORM(xyz1, matrixXForm);
			uvw  = UnitCellProcessors.calculateDirectionOfPlaneNormal(uc, or.getzAspect(), or.getzVectorType());
			
			if(vectorDotProduct(uvw, xyz1)){
				xyz2  = UnitCellProcessors.calculateDirectionOfPlaneNormal(uc, or.getyAspect(), or.getyVectorType());
				xyz2 = MatrixProcessors.TRANSFORM_VECTOR(xyz2,matrixXForm);
				xyz2 = MatrixProcessors.TRANSFORM_VECTOR(xyz2,newMatrix);
				vForm = MatrixProcessors.FIND_VERT_XFORM(xyz2[0],xyz2[1]);
				newMatrix = MatrixProcessors.MATRIX_MULTIPLY(newMatrix,vForm, newMatrix);
				MatrixProcessors.RotatateMatrixAxis(vForm,or.getRotationAboutAspectY(),2);
				MatrixProcessors.MATRIX_MULTIPLY(newMatrix,vForm,newMatrix);
				MatrixProcessors.RotatateMatrixAxis(vForm,or.getRotationAboutZ(),2);
				MatrixProcessors.MATRIX_MULTIPLY(newMatrix,vForm,newMatrix);
			}
			NormalizeRotationMatrix(newMatrix);
			SetMatrixAEqB(aMatrix,newMatrix);
			return;
	}
}
