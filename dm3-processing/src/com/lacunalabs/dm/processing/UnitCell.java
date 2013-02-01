package com.lacunalabs.dm.processing;

import java.util.ArrayList;
import java.util.Arrays;

public class UnitCell {
	private UnitCellParameters parameters;
	private ArrayList<ScatteringAtom> atoms;
	
	public UnitCell()
	{
		super();
		parameters = new UnitCellParameters();
		atoms = new ArrayList<ScatteringAtom>(Arrays.asList(new ScatteringAtom()));
		for(ScatteringAtom atom : atoms)
		{
			atom.setScatteringFactors(new SimpleScatteringFactor(atom.getAtomicNumber()));
		}
	}
	
	public UnitCell(UnitCellParameters parameters,
			ArrayList<ScatteringAtom> atoms) {
		super();
		this.parameters = parameters;
		this.atoms = atoms;
	}

	public UnitCellParameters getParameters() {
		return parameters;
	}
	public void setParameters(UnitCellParameters parameters) {
		this.parameters = parameters;
	}
	public ArrayList<ScatteringAtom> getAtoms() {
		return atoms;
	}
	public void setAtoms(ArrayList<ScatteringAtom> atoms) {
		this.atoms = atoms;
	}
	
}
