%% SR500_hex.m  –  ODF φ2 sections for SR500 (hex EBSD, 0–90°×0–90°)
clearvars; close all; clc;

thisFile=mfilename('fullpath'); if ~isempty(thisFile), cd(fileparts(thisFile)); end
condLabel="SR500"; fname="0.ang";

outRoot=fullfile("..","..","LPBF_SDSS");
outFig=fullfile(outRoot,"figures",condLabel);
outScr=fullfile(outRoot,"scripts");
if ~exist(outFig,"dir"), mkdir(outFig); end
if ~exist(outScr,"dir"), mkdir(outScr); end

cs={ ...
 crystalSymmetry('m-3m',[2.87 2.87 2.87],'mineral','Ferrite','color','red'), ...
 crystalSymmetry('m-3m',[3.60 3.60 3.60],'mineral','Austenite','color','blue')};

ebsd=EBSD.load(fname,cs,'interface','ang','convertEuler2SpatialReferenceFrame','setting 1');
ebsd=ebsd('indexed');
[ebsdFerr,ebsdAust]=pickDuplexPhases(ebsd);

phi2Vals=[0 45 65]*degree; win=[0 90]; hw=10*degree; res=10*degree;

odfFerr=calcDensity(ebsdFerr.orientations,'halfwidth',hw,'resolution',res);
f1=figure('Name',condLabel+" – Ferrite ODF φ2");
plotSection(odfFerr,'phi2',phi2Vals); cb=mtexColorbar; set(get(cb,'Label'),'String','MRD');
formatODFAxes(win); mtexTitle(condLabel+" hex – Ferrite ODF, \phi_2 = 0^\circ, 45^\circ, 65^\circ");
exportgraphics(f1,fullfile(outFig,"SR500_Ferrite_ODF_phi2_0_45_65.png"),'Resolution',600);

odfAust=calcDensity(ebsdAust.orientations,'halfwidth',hw,'resolution',res);
f2=figure('Name',condLabel+" – Austenite ODF φ2");
plotSection(odfAust,'phi2',phi2Vals); cb=mtexColorbar; set(get(cb,'Label'),'String','MRD');
formatODFAxes(win); mtexTitle(condLabel+" hex – Austenite ODF, \phi_2 = 0^\circ, 45^\circ, 65^\circ");
exportgraphics(f2,fullfile(outFig,"SR500_Austenite_ODF_phi2_0_45_65.png"),'Resolution',600);

copyfile(thisFile + ".m", fullfile(outScr,"SR500_hex.m"));
disp("Done: "+condLabel);

function [ebsdFerr, ebsdAust] = pickDuplexPhases(ebsd)
ph=string(ebsd.mineralList); ferr=""; aust="";
if any(strcmpi(ph,"Ferrite")), ferr="Ferrite"; end
if any(strcmpi(ph,"Austenite")), aust="Austenite"; end
if ferr=="", idx=find(contains(lower(ph),"ferr"),1); if ~isempty(idx), ferr=ph(idx); end, end
if aust=="", idx=find(contains(lower(ph),"aust")|contains(lower(ph),"gamma"),1); if ~isempty(idx), aust=ph(idx); end, end
if ferr=="" || aust=="", error("Phase names not found. Phases: %s", strjoin(ph,", ")); end
ebsdFerr=ebsd(char(ferr)); ebsdAust=ebsd(char(aust));
end

function formatODFAxes(win)
axAll=findall(gcf,'Type','axes');
isCB=arrayfun(@(h) strcmp(get(h,'Tag'),'Colorbar'), axAll);
axODF=flipud(axAll(~isCB));
for k=1:numel(axODF)
    set(axODF(k),'XLim',win,'YLim',win); axis(axODF(k),'square');
    t=get(axODF(k),'Title'); if isgraphics(t), t.String=""; end
end
end
