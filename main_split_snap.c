#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
#include <string.h>


/* Index preprocessor for the C-Order */
#define INDEX(i,j,k) (k)+GV.lengthDivs*((j)+GV.lengthDivs*(i))

#include "structures.h"
#include "readWrite.h"

int main(int argc, char *argv[])
{  
  char *infile=NULL;
  int f, m;
  char NFilename[100];
  char buffer[50];
  double auxFiles;
  

  int i, j, k, l, index, indexaux, Np, idPart;
  int ii, jj, kk;
  double xc, yc, zc; // Positions of the cells
  double xp, yp, zp, vxp, vyp, vzp, vmod; // Positions and velocities of the particles
  double Window_fn; //Window function
  double norm_factor; //Normalization factor for the momentum computation
  
  FILE *pf = NULL;
  //--- For verifications ---
  double totalMass=0.0, totMassCIC=0.0;
  int sumaPart = 0;
  double sumaMom[3], sumaVel[3], sumaVelModule;
  double sumaMomPart[3], sumaVelPart[3];
  double auxMom[3], auxVel[3];
  

  //////////////////////////////////
  //* READING GADGET BINARY FILE *//
  //////////////////////////////////
  if(argc < 2)
    {
      printf("Error: Incomplete number of parameters. Execute as follows:\n");
      printf("%s Parameters_file\n", argv[0]);
      exit(0);
    }//if   
  
  infile     = argv[1];             // Parameters file
  read_parameters(infile);
  
  /*+++++ Transforming the number of files to separation in one axis +++++*/
  auxFiles = pow(GV.NFiles, 1.0/3.0);
  GV.SnapLength = 1.0 / auxFiles;

  /*+++++ Reading original GADGET snapshot +++++*/
  GV.NpTot = readGADGETBinaryFile();

  /* Cosmological parameters */  
  GV.OmegaM0 = Header.Omega0;
  GV.OmegaL0 = Header.OmegaLambda;
  GV.zRS = Header.redshift;
  GV.HubbleParam = Header.HubbleParam;

  /* Simulation parameters */
  GV.L = Header.BoxSize;  
  GV.mass = Header.mass[1];

  printf("-----------------------------------------------\n");
  printf("Cosmological parameters:\n");
  printf("OmegaM0=%lf OmegaL0=%lf redshift=%lf HubbleParam=%lf\n",
	 GV.OmegaM0,
	 GV.OmegaL0,
	 GV.zRS,
	 GV.HubbleParam);
  printf("-----------------------------------------------\n");

  printf("Filename=%s\n", GV.FILENAME);
  printf("-----------------------------------------------\n");


  //////////////////////////////
  //* Dividing particles in the files *//
  //////////////////////////////

  for(i=0; i<( (int)auxFiles ); i++)
    {
      for(j=0; j<( (int)auxFiles ); j++)
	{
	  for(k=0; k<( (int)auxFiles ); k++)
	    {
	      f = INDEX(i,j,k);
	      snprintf(buffer, sizeof(char)*50, "./Box_400_512_150.%d", f);
	      
	      // Memory allocation for part variable
	      if(copyPart == NULL)
		{
		  copyPart = (struct particle *) calloc((size_t) 1, sizeof(struct particle));
		}    	      
	      
	      for(m=0; m<GV.NpTot; m++)
		{
		  
		  if( (part[m].pos[X] >= (i* GV.SnapLength)) &&  (part[m].pos[X] < ((i+1)* GV.SnapLength))  )
		    {
		      if( (part[m].pos[Y] >= (j* GV.SnapLength)) &&  (part[m].pos[Y] < ((j+1)* GV.SnapLength))  )
			{
			  if( (part[m].pos[Z] >= (k* GV.SnapLength)) &&  (part[m].pos[Z] < ((k+1)* GV.SnapLength))  )
			    {
			      /*..... Copying positions .....*/
			      copyPart[m].pos[X] = part[m].pos[X];
			      copyPart[m].pos[Y] = part[m].pos[Y];
			      copyPart[m].pos[Z] = part[m].pos[Z];
			      
			      /*..... Copying velocities .....*/
			      copyPart[m].vel[X] = part[m].vel[X];
			      copyPart[m].vel[Y] = part[m].vel[Y];
			      copyPart[m].vel[Z] = part[m].vel[Z];
			      
			      copyPart[i].id = part[i].id;
			      copyPart[i].mass = part[m].mass;
			      
			    }//if z			  
			}//if y		      
		    }//if x

		  copyPart = (struct particle *) realloc(copyPart, sizeof(copyPart) + 1);
		  
		}//for m	      
	      
	      writeGADGETBinaryFile(buffer);	      

	      free(copyPart);

	      
	      if(f%((int)GV.NFiles)==0)
		{
		  printf("File %d was writen\n", f);
		}//if

	    }//for k
	}//for j      
    }//for i


 
  /* Freeing up memory allocation */
  free(part);
  
  return 0;
}//main