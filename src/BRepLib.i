/*
 * Project Info:  http://jcae.sourceforge.net
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
 *
 * (C) Copyright 2005, by EADS CRC
 */

%{
#include <BRepLib.hxx>
%}

class BRepLib
{
    public:
    %rename(encodeRegularity) EncodeRegularity;
    %rename(buildCurves3d) BuildCurves3d;
    static void EncodeRegularity(const TopoDS_Shape& S,const Standard_Real TolAng = 1.0e-10) ;
    static Standard_Boolean BuildCurves3d (const TopoDS_Shape& S) ;

};

