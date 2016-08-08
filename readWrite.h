
//Convert data file text in plain text 
int conf2dump( char filename[] )
{
  int nread;
  char cmd[1000];
  
  printf("Inside conf2dump routine\n");
  
  sprintf( cmd, 
	   "grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump", 
	   filename, filename );
  
  /*
    sprintf( cmd, 
    "grep -v \"#\" %s | grep -v \"^$\" | awk -F\"=\" '{print $2}' > %s.dump", 
    filename, filename );
  */
  system( cmd );
  
  printf("Leaving conf2dump routine\n");
  return 0;
}
/*************************************************************/



/*************************************************************/
//Read file with and load information  

int read_parameters( char filename[] )
{
    char cmd[1000], filenamedump[1000];
    FILE *file;

    //Loading the file
    printf("Filename: %s\n", filename);
    file = fopen( filename, "r" );
    if( file==NULL )
      {
	printf( "  * The file '%s' doesn't exist!\n", filename );
	return 1;
      }
    fclose(file);
    
    //Converting to plain text
    printf("Converting to plain text\n");
    conf2dump( filename );
    sprintf( filenamedump, "%s.dump", filename );
    file = fopen( filenamedump, "r" );
    
    /*Reading filename*/
    fscanf(file, "%d", &GV.lengthDivs);     
    fscanf(file, "%s", GV.FILENAME); 

    GV.NFiles = 1.0 * GV.lengthDivs * GV.lengthDivs* GV.lengthDivs;

    fclose( file );
    
    printf( "  * The file '%s' has been loaded!\n", filename );

    sprintf( cmd, "rm -rf %s.dump", filename );
    system( cmd );
    
    return 0;
}



/****************************************************************************************************          
NAME: readGADGETBinaryFile                                                                                      
FUNCTION: Reads a binary file in GADGET format
INPUT: none                                                                                                 
RETURN: 0                                                                                                    
****************************************************************************************************/
int readGADGETBinaryFile(){
  FILE *fdata = NULL;
  int i, j;
  int N_tot, N_min, N_max, dummy, nread=0;
  float Maux, faux[3];
  unsigned int uintaux;

  printf("############################################################\n");
  printf("Reading snapshot %s\n", GV.FILENAME);
  fdata = fopen(GV.FILENAME,"r");
  if(fdata == NULL)
    {
      printf("File %s cannot be open\n", GV.FILENAME);
    }

  nread = fread(&dummy, sizeof(dummy), 1, fdata);
  nread = fread(&Header, sizeof(struct gadget_head), 1, fdata);
  nread = fread(&dummy, sizeof(dummy), 1, fdata);

  N_tot = 0;


  printf("----------------------------------------\n");
  printf("Reading snapshot with:\n");
  printf("----------------------------------------\n");
  for(i = 0; i<6; i++)
    {
      N_tot += Header.npartTotal[i];
      printf("Type %d has Npart=%12d NpartTotal=%12d with mass %16.8lf\n", i,
	     Header.Npart[i], Header.npartTotal[i], Header.mass[i]);
    }//for i 


  printf(" There is a total %d particles in the snapshot\n\n", N_tot);
  printf("----------------------------------------\n");
  printf(" * Frame's Time... %16.8f\n",Header.time);
  printf(" * Redshift... %16.8f\n",Header.redshift);
  printf(" * Flagsfr... %d\n",Header.flag_sfr);
  printf(" * Flagfed... %d\n",Header.flag_feedback);
  printf(" * Flagcool... %d\n",Header.flag_cooling);
  printf(" * numfiles... %d\n",Header.num_files);
  printf(" * Boxsize... %16.8f\n",Header.BoxSize);
  printf(" * Omega0... %16.8f\n",Header.Omega0);
  printf(" * OmageLa... %16.8f\n",Header.OmegaLambda);
  printf(" * Hubbleparam... %16.8f\n",Header.HubbleParam);

  // Memory allocation for part variable
  part = (struct particle *) calloc((size_t) N_tot,sizeof(struct particle));

  if(part == NULL)
    {
      printf("Structure particles could not be allocated\n");
      exit(0);
    }//if

  /*********************/
  /* Getting positions */
  /*********************/
  nread=fread(&dummy, sizeof(dummy), 1, fdata);
  for(i=0; i<N_tot; i++)
    {
      nread=fread(&faux[0], sizeof(float), 3, fdata);
      part[i].pos[X] = faux[0];
      part[i].pos[Y] = faux[1];
      part[i].pos[Z] = faux[2];
    }//for i
  nread=fread(&dummy, sizeof(dummy), 1, fdata);
  
  if(dummy != (3*N_tot*sizeof(float)))
    {
      printf(" Can not read properly ids %d %lu\n",dummy,3*N_tot*sizeof(float));
      exit(0);
    }//if
  
  /**********************/
  /* Getting velocities */
  /**********************/
  nread=fread(&dummy,sizeof(dummy),1,fdata);
  for(i=0; i<N_tot; i++)
    {
      nread=fread(&faux[0],sizeof(float),3,fdata);
      part[i].vel[X] = faux[0];
      part[i].vel[Y] = faux[1];
      part[i].vel[Z] = faux[2];
    }//for i
  
  
  nread=fread(&dummy, sizeof(dummy), 1, fdata);
  if(dummy != (3*N_tot*sizeof(float)))
    {
      printf(" Can not read properly ids %d %lu\n", dummy, 3*N_tot*sizeof(float));
      exit(0);
    }//if
  
  
  /****************/
  /* Getting ID's */
  /****************/
  nread=fread(&dummy, sizeof(dummy), 1, fdata);
  for(i=0; i<N_tot; i++)
    {
      nread=fread(&uintaux, sizeof(unsigned int), 1, fdata);
      part[i].id = uintaux;
    }//for i
  
  nread=fread(&dummy, sizeof(dummy), 1, fdata);
  if(dummy != (N_tot*sizeof(unsigned int)))
    {
      printf(" Can not read properly ids %d %lu\n", dummy, N_tot*sizeof(unsigned int));
      exit(0);
    }//if 
  
  /******************/
  /* Getting masses */
  /******************/
  nread=fread(&dummy, sizeof(dummy),1,fdata);
  N_min = N_max=0;
  for(j=0; j<=5; j++)
    {
      N_max=N_max+Header.npartTotal[j];
      if((Header.mass[j]==0) && (Header.npartTotal[j]!=0)){
	for(i=N_min;i<N_max;i++){
	  nread=fread(&Maux,sizeof(float),1,fdata);
	  part[i].mass = Maux;
	}//for i
      }//if
      if((Header.mass[j]!=0) && (Header.npartTotal[j]!=0)){
	for(i=N_min;i<N_max;i++){
	  part[i].mass = Header.mass[j];
	}//for i
      }//if
      N_min=N_max;
    }//for j
  nread=fread(&dummy,sizeof(dummy),1,fdata);
  fclose(fdata);
  return N_tot;
}//readGADGET





/****************************************************************************************************          
NAME: writeGADGETBinaryFile                                                                                      
FUNCTION: writes several binary files in GADGET format
INPUT: none                                                                                                 
RETURN: 0                                                                                                    
****************************************************************************************************/


int writeGADGETBinaryFile(char FileNum[100]){
  FILE *fdata = NULL;
  int i, j;
  int N_tot, N_min, N_max, dummy, nread=0;
  float Maux, faux[3];
  unsigned int uintaux;

  printf("############################################################\n");
  printf("Writing in file %s\n", FileNum);
  fdata = fopen(FileNum,"w");
  
  
  if(fdata == NULL)
    {
      printf("File %s cannot be open\n", FileNum);
    }
  printf("File %s is ready to be writen\n", FileNum);

  N_tot = GV.NpTot;
  printf("N_tot = %d, GV.NpTot = %d", N_tot, GV.NpTot);
  
  fwrite(&dummy, sizeof(dummy), 1, fdata);
  fwrite(&Header, sizeof(struct gadget_head), 1, fdata);
  fwrite(&dummy, sizeof(dummy), 1, fdata);

  printf("Header writen\n");

  /*********************/
  /* Positions */
  /*********************/
  dummy = 3*N_tot*sizeof(float);
  
  printf("dummy = %d\n", dummy);
  
  fwrite(&dummy, sizeof(dummy), 1, fdata);
  printf("dummy writen\n");
  for(i=0; i<N_tot; i++)
    {      
      faux[X] = copyPart[i].pos[X];
      faux[Y] = copyPart[i].pos[Y];
      faux[Z] = copyPart[i].pos[Z];
      fwrite(&faux[0], sizeof(float), 3, fdata);
    }//for i
  nread=fwrite(&dummy, sizeof(dummy), 1, fdata);
  
  printf("Positions writen\n");
  /**********************/
  /* Velocities */
  /**********************/
  fwrite(&dummy,sizeof(dummy),1,fdata);
  for(i=0; i<N_tot; i++)
    {
      faux[X] = copyPart[i].vel[X];
      faux[Y] = copyPart[i].vel[Y];
      faux[Z] = copyPart[i].vel[Z];
      fwrite(&faux[0],sizeof(float),3,fdata);
    }//for i
  printf("Velocities writen\n");
    
  /****************/
  /* ID's */
  /****************/
  dummy = N_tot*sizeof(unsigned int);
  fwrite(&dummy, sizeof(dummy), 1, fdata);
  for(i=0; i<N_tot; i++)
    {      
      uintaux = copyPart[i].id;
      nread=fwrite(&uintaux, sizeof(unsigned int), 1, fdata);
    }//for i
  printf("IDs writen\n");
  
  /******************/
  /* Getting masses */
  /******************/
  dummy = 3*N_tot*sizeof(float);
  fwrite(&dummy, sizeof(dummy),1,fdata);
  
  /*
  for(i=0; i<N_tot; i++)
    {
      Maux = copyPart[i].mass;
      fwrite(&Maux, sizeof(float), 1, fdata);
    }//for i
  */
  
  
  N_min = N_max=0;
  for(j=0; j<=5; j++)
    {
      N_max=N_max+Header.npartTotal[j];
      if((Header.mass[j]==0) && (Header.npartTotal[j]!=0))
	{
	  for(i=N_min;i<N_max;i++)
	    {
	      Maux = copyPart[i].mass;
	      fwrite(&Maux,sizeof(float),1,fdata);
	    }//for i
	}//if
      
      if((Header.mass[j]!=0) && (Header.npartTotal[j]!=0))
	{
	  for(i=N_min;i<N_max;i++)
	    {
	      Maux = Header.mass[j];
	    }//for i
	}//if
      N_min=N_max;
    }//for j


  /*
  N_min = N_max=0;
  for(j=0; j<=5; j++)
    {
      N_max=N_max+Header.npartTotal[j];
      if((Header.mass[j]==0) && (Header.npartTotal[j]!=0))
	{
	  for(i=N_min;i<N_max;i++){
	    fwrite(&Maux,sizeof(float),1,fdata);
	    Maux = copyPart[i].mass;
	  }//for i
	}//if
      
      if((Header.mass[j]!=0) && (Header.npartTotal[j]!=0))
	{
	  for(i=N_min;i<N_max;i++)
	    {
	      copyPart[i].mass = Header.mass[j];
	    }//for i
	}//if
      N_min=N_max;
    }//for j
  */
  fwrite(&dummy,sizeof(dummy),1,fdata);
  fclose(fdata);

  return 0;

}//writeGADGET

