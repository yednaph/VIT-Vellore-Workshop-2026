<b> Steps to Prepare a Supercell in VESTA</b>
1. Open VESTA and load your cIF file for the unit cell.
2.  Go to the menu Edit → Edit Data → Unit Cell.
3. Click on the Transform... button in the dialog box that appears.
4. In the "Transformation Matrix" window, modify the diagonal elements of the matrix (P) to the desired size (e.g., set 2 2 2 for a 2x2x2 supercell).
Ensure the off-diagonal elements are 0 to keep the supercell rectangular if desired.
5. Click OK. A prompt will appear asking how to convert the structure; select "Add new equivalent positions" to generate the atoms within the new, larger boundary.
6. Finaly Click Apply in the "Edit Data" window to finalize the changes.
7. To save the new structure, go to File → Export Data... and choose the desired format (e.g., VASP/POSCAR or CIF).


8.To perform doping or create vacancies, it is often necessary to break symmetry. 
Go to Edit → Edit Data → Unit Cell and click "Remove Symmetry" before editing atoms.
