package com.lacunalabs.dm.processing;

public class MatrixProcessors {

	static public double[] TRANSFORM_VECTOR(double[] v, double xForm[][]) {
		return TRANSFORM_VECTOR(v[0], v[1], v[2], xForm);
	}
	
	static public double[] TRANSFORM_VECTOR(double a, double b, double c, double xForm[][]) {
		double x, y, z;
		x = a;
		y = b;
		z = c;
		a = x * xForm[0][0] + y * xForm[0][1] + z * xForm[0][2];
		b = x * xForm[1][0] + y * xForm[1][1] + z * xForm[1][2];
		c = x * xForm[2][0] + y * xForm[2][1] + z * xForm[2][2];
		return new double[] { a, b, c };
	}

	static public double[][] IDENTITY_MATRIX() {
		double[][] m = new double[3][3];
		m[0][0] = m[1][1] = m[2][2] = 1.0;
		m[0][1] = m[0][2] = 0.0;
		m[1][0] = m[1][2] = 0.0;
		m[2][0] = m[2][1] = 0.0;
		return m;
	}
	
	static public double[][] FIND_CENTER_XFORM(double[] v, double[][] xForm)							
	{
		return FIND_CENTER_XFORM( v[0],  v[1],  v[2], xForm);
	}
	
	static public double[][] FIND_CENTER_XFORM(double x,double y,double z,double[][] xForm)							
	{																
		double[][] A_M = new double[3][3];
		double[][] B_M = new double[3][3];
		double[][] C_M = new double[3][3];						
		double	r_M;												
		double	Z_FABS,Y_FABS,X_FABS;								
		NORMALIZE_VECTOR(x,y,z);									
		r_M	= Math.sqrt(x * x + y * y);									
		Z_FABS = Math.abs(z);											
		Y_FABS = Math.abs(y);											
		X_FABS = Math.abs(x);											
		if(r_M < .0000000001){										
			if(Z_FABS < .0000000001)								
				xForm[0][0] = xForm[1][1] = xForm[2][2] = 1.0;		
			else{													
				 xForm[1][1] = 1.0;									
				xForm[0][0] = xForm[2][2] = z/Z_FABS;				
			}														
			xForm[0][1] = xForm[0][2] = 0.0;						
			xForm[1][0] = xForm[1][2] = 0.0;						
			xForm[2][0] = xForm[2][1] = 0.0;						
		} else {													
			A_M[0][0] = A_M[1][1] = x / r_M;						
			A_M[0][1] = y / r_M;									
			A_M[1][0] = -y / r_M;									
			A_M[2][2] = 1.;											
			A_M[0][2] = A_M[1][2] = A_M[2][0] = A_M[2][1] = 0.0;	
			B_M[0][0] = B_M[2][2] = z;								
			B_M[0][2] = -r_M;										
			B_M[2][0] = r_M;										
			B_M[1][1] = 1;											
			B_M[0][1] = B_M[1][0] = B_M[1][2] = B_M[2][1] = 0.0;	
			MATRIX_MULTIPLY(A_M,B_M,C_M);							
			A_M[0][1] = -y / r_M;									
			A_M[1][0] = y / r_M;									
			MATRIX_MULTIPLY(C_M,A_M,xForm);							
		}	
		return xForm;
	}																


	static public double[][] MATRIX_MULTIPLY(double[][] A, double[][] B,
			double[][] C) {
		double b0_M, b1_M, b2_M, a0_M, a1_M;
		double[][] D_M = new double[3][3];

		a0_M = A[0][0];
		a1_M = A[1][0];
		b0_M = B[0][0];
		b1_M = B[0][1];
		b2_M = B[0][2];

		D_M[0][0] = a0_M * b0_M + a1_M * b1_M + A[2][0] * b2_M;
		D_M[0][1] = A[0][1] * b0_M + A[1][1] * b1_M + A[2][1] * b2_M;
		D_M[0][2] = A[0][2] * b0_M + A[1][2] * b1_M + A[2][2] * b2_M;

		b0_M = B[1][0];
		b1_M = B[1][1];
		b2_M = B[1][2];
		D_M[1][0] = a0_M * b0_M + a1_M * b1_M + A[2][0] * b2_M;
		D_M[1][1] = A[0][1] * b0_M + A[1][1] * b1_M + A[2][1] * b2_M;
		D_M[1][2] = A[0][2] * b0_M + A[1][2] * b1_M + A[2][2] * b2_M;

		b0_M = B[2][0];
		b1_M = B[2][1];
		b2_M = B[2][2];
		D_M[2][0] = a0_M * b0_M + a1_M * b1_M + A[2][0] * b2_M;
		D_M[2][1] = A[0][1] * b0_M + A[1][1] * b1_M + A[2][1] * b2_M;
		D_M[2][2] = A[0][2] * b0_M + A[1][2] * b1_M + A[2][2] * b2_M;

		C[0][0] = D_M[0][0];
		C[0][1] = D_M[0][1];
		C[0][2] = D_M[0][2];
		C[1][0] = D_M[1][0];
		C[1][1] = D_M[1][1];
		C[1][2] = D_M[1][2];
		C[2][0] = D_M[2][0];
		C[2][1] = D_M[2][1];
		C[2][2] = D_M[2][2];
		return C;
	}

	static public double[][] FIND_HORIZ_XFORM(double x, double y) {
		double r_M;
		double xForm[][] = new double[3][3];
		r_M = Math.sqrt(x * x + y * y);

		if (r_M == 0.) {
			xForm[0][0] = xForm[1][1] = xForm[2][2] = 1.0;
			xForm[0][1] = xForm[0][2] = 0.0;
			xForm[1][0] = xForm[1][2] = 0.0;
			xForm[2][0] = xForm[2][1] = 0.0;
			return xForm;
		}
		xForm[0][2] = xForm[1][2] = xForm[2][1] = xForm[2][0] = 0.0;
		xForm[0][0] = xForm[1][1] = y / r_M;
		xForm[0][1] = -x / r_M;
		xForm[1][0] = -xForm[0][1];
		xForm[2][2] = 1.0;
		return xForm;
	}

	static public double[][] FIND_VERT_XFORM(double x, double y) {
		double r_M;
		double[][] xForm = new double[3][3];
		r_M = Math.sqrt(x * x + y * y);

		if (r_M == 0.) {
			xForm[0][0] = xForm[1][1] = xForm[2][2] = 1.0;
			xForm[0][1] = xForm[0][2] = 0.0;
			xForm[1][0] = xForm[1][2] = 0.0;
			xForm[2][0] = xForm[2][1] = 0.0;
			return xForm;
		}
		xForm[0][2] = xForm[1][2] = xForm[2][1] = xForm[2][0] = 0.0;
		xForm[0][0] = xForm[1][1] = -x / r_M;
		xForm[0][1] = -y / r_M;
		xForm[1][0] = -xForm[0][1];
		xForm[2][2] = 1.0;
		return xForm;
	}

	static public double[][] INVERT_MATRIX(double[][] m) {
		double x_M;

		x_M = m[0][1];
		m[0][1] = m[1][0];
		m[1][0] = x_M;

		x_M = m[0][2];
		m[0][2] = m[2][0];
		m[2][0] = x_M;

		x_M = m[1][2];
		m[1][2] = m[2][1];
		m[2][1] = x_M;
		return m;
	}

	static public double[] NORMALIZE_VECTOR(double x, double y, double z) {
		double length_M;

		length_M = Math.sqrt(x * x + y * y + z * z);
		if (length_M < .0000001) {
			length_M = 0.0;
			x = 0.0;
			y = 0.0;
			z = 0.0;
		} else {
			length_M = 1.0 / length_M;
			x *= length_M;
			y *= length_M;
			z *= length_M;
		}
		return new double[] { x, y, z };
	}
	
	static public double vectorDotProduct(double[] x1, double[] x2)
	{
		return x1[0]*x2[0] + x1[1]*x2[1] + x1[2]*x2[2];
	}
	
	public static void RotaateMatrixAxis(double[][] theXForm,double rotAngle,short axis)
	{
		double x,y,length;

		x = Math.cos(rotAngle);
		y = Math.sin(rotAngle);
		length = Math.sqrt(x * x + y * y);
		x /= length;
		y /= length;
		switch(axis)
		{
			case 0:/*about x*/
				theXForm[0][0] = 1.0;
				theXForm[0][1] = theXForm[1][0] = theXForm[0][2] = theXForm[2][0] = 0.0;
				theXForm[1][1] = theXForm[2][2] = x;
				theXForm[1][2] = -y;
				theXForm[2][1] = y;
			break;
			case 1:/*about y*/
				theXForm[0][0] = theXForm[2][2] = x;
				theXForm[0][2] = -y;
				theXForm[0][1] = theXForm[1][0] = theXForm[1][2] = theXForm[2][1] = 0.0;
				theXForm[2][0] = y;
				theXForm[1][1] = 1.0;
		
			break;
			case 2:
				theXForm = FIND_HORIZ_XFORM(y,x);
			break;
			default:
			break;
		}
		NormalizeRotationMatrix(theXForm);
	
	}


}
