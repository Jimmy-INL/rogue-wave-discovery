#!/bin/bash
set -e

OUTDIR="./data"

BASE_URL="https://erda.ku.dk/archives/ee6b452c1907fbd48271b071c3cee10e/Ocean/rogue-analysis-inputs-v6"

STATIONS="\
fowd_cdip_028p1_filtered-preprocessed-agg.parquet
fowd_cdip_029p1_filtered-preprocessed-agg.parquet
fowd_cdip_036p1_filtered-preprocessed-agg.parquet
fowd_cdip_043p1_filtered-preprocessed-agg.parquet
fowd_cdip_045p1_filtered-preprocessed-agg.parquet
fowd_cdip_067p1_filtered-preprocessed-agg.parquet
fowd_cdip_071p1_filtered-preprocessed-agg.parquet
fowd_cdip_076p1_filtered-preprocessed-agg.parquet
fowd_cdip_081p1_filtered-preprocessed-agg.parquet
fowd_cdip_087p1_filtered-preprocessed-agg.parquet
fowd_cdip_088p1_filtered-preprocessed-agg.parquet
fowd_cdip_089p1_filtered-preprocessed-agg.parquet
fowd_cdip_090p1_filtered-preprocessed-agg.parquet
fowd_cdip_091p1_filtered-preprocessed-agg.parquet
fowd_cdip_092p1_filtered-preprocessed-agg.parquet
fowd_cdip_093p1_filtered-preprocessed-agg.parquet
fowd_cdip_094p1_filtered-preprocessed-agg.parquet
fowd_cdip_095p1_filtered-preprocessed-agg.parquet
fowd_cdip_096p1_filtered-preprocessed-agg.parquet
fowd_cdip_097p1_filtered-preprocessed-agg.parquet
fowd_cdip_098p1_filtered-preprocessed-agg.parquet
fowd_cdip_099p1_filtered-preprocessed-agg.parquet
fowd_cdip_100p1_filtered-preprocessed-agg.parquet
fowd_cdip_101p1_filtered-preprocessed-agg.parquet
fowd_cdip_102p1_filtered-preprocessed-agg.parquet
fowd_cdip_103p1_filtered-preprocessed-agg.parquet
fowd_cdip_104p1_filtered-preprocessed-agg.parquet
fowd_cdip_105p1_filtered-preprocessed-agg.parquet
fowd_cdip_106p1_filtered-preprocessed-agg.parquet
fowd_cdip_107p1_filtered-preprocessed-agg.parquet
fowd_cdip_109p1_filtered-preprocessed-agg.parquet
fowd_cdip_111p1_filtered-preprocessed-agg.parquet
fowd_cdip_113p1_filtered-preprocessed-agg.parquet
fowd_cdip_114p1_filtered-preprocessed-agg.parquet
fowd_cdip_115p1_filtered-preprocessed-agg.parquet
fowd_cdip_116p1_filtered-preprocessed-agg.parquet
fowd_cdip_117p1_filtered-preprocessed-agg.parquet
fowd_cdip_118p1_filtered-preprocessed-agg.parquet
fowd_cdip_121p1_filtered-preprocessed-agg.parquet
fowd_cdip_122p1_filtered-preprocessed-agg.parquet
fowd_cdip_123p1_filtered-preprocessed-agg.parquet
fowd_cdip_124p1_filtered-preprocessed-agg.parquet
fowd_cdip_125p1_filtered-preprocessed-agg.parquet
fowd_cdip_126p1_filtered-preprocessed-agg.parquet
fowd_cdip_128p1_filtered-preprocessed-agg.parquet
fowd_cdip_130p1_filtered-preprocessed-agg.parquet
fowd_cdip_131p1_filtered-preprocessed-agg.parquet
fowd_cdip_132p1_filtered-preprocessed-agg.parquet
fowd_cdip_133p1_filtered-preprocessed-agg.parquet
fowd_cdip_134p1_filtered-preprocessed-agg.parquet
fowd_cdip_135p1_filtered-preprocessed-agg.parquet
fowd_cdip_136p1_filtered-preprocessed-agg.parquet
fowd_cdip_138p1_filtered-preprocessed-agg.parquet
fowd_cdip_139p1_filtered-preprocessed-agg.parquet
fowd_cdip_141p1_filtered-preprocessed-agg.parquet
fowd_cdip_142p1_filtered-preprocessed-agg.parquet
fowd_cdip_143p1_filtered-preprocessed-agg.parquet
fowd_cdip_144p1_filtered-preprocessed-agg.parquet
fowd_cdip_146p1_filtered-preprocessed-agg.parquet
fowd_cdip_147p1_filtered-preprocessed-agg.parquet
fowd_cdip_149p1_filtered-preprocessed-agg.parquet
fowd_cdip_150p1_filtered-preprocessed-agg.parquet
fowd_cdip_151p1_filtered-preprocessed-agg.parquet
fowd_cdip_152p1_filtered-preprocessed-agg.parquet
fowd_cdip_153p1_filtered-preprocessed-agg.parquet
fowd_cdip_154p1_filtered-preprocessed-agg.parquet
fowd_cdip_155p1_filtered-preprocessed-agg.parquet
fowd_cdip_156p1_filtered-preprocessed-agg.parquet
fowd_cdip_157p1_filtered-preprocessed-agg.parquet
fowd_cdip_158p1_filtered-preprocessed-agg.parquet
fowd_cdip_160p1_filtered-preprocessed-agg.parquet
fowd_cdip_161p1_filtered-preprocessed-agg.parquet
fowd_cdip_162p1_filtered-preprocessed-agg.parquet
fowd_cdip_163p1_filtered-preprocessed-agg.parquet
fowd_cdip_164p1_filtered-preprocessed-agg.parquet
fowd_cdip_165p1_filtered-preprocessed-agg.parquet
fowd_cdip_166p1_filtered-preprocessed-agg.parquet
fowd_cdip_166p3_filtered-preprocessed-agg.parquet
fowd_cdip_167p1_filtered-preprocessed-agg.parquet
fowd_cdip_168p1_filtered-preprocessed-agg.parquet
fowd_cdip_169p1_filtered-preprocessed-agg.parquet
fowd_cdip_170p1_filtered-preprocessed-agg.parquet
fowd_cdip_171p1_filtered-preprocessed-agg.parquet
fowd_cdip_172p1_filtered-preprocessed-agg.parquet
fowd_cdip_174p1_filtered-preprocessed-agg.parquet
fowd_cdip_176p1_filtered-preprocessed-agg.parquet
fowd_cdip_179p1_filtered-preprocessed-agg.parquet
fowd_cdip_180p1_filtered-preprocessed-agg.parquet
fowd_cdip_181p1_filtered-preprocessed-agg.parquet
fowd_cdip_182p1_filtered-preprocessed-agg.parquet
fowd_cdip_184p1_filtered-preprocessed-agg.parquet
fowd_cdip_185p1_filtered-preprocessed-agg.parquet
fowd_cdip_186p1_filtered-preprocessed-agg.parquet
fowd_cdip_187p1_filtered-preprocessed-agg.parquet
fowd_cdip_188p1_filtered-preprocessed-agg.parquet
fowd_cdip_189p1_filtered-preprocessed-agg.parquet
fowd_cdip_190p1_filtered-preprocessed-agg.parquet
fowd_cdip_191p1_filtered-preprocessed-agg.parquet
fowd_cdip_192p1_filtered-preprocessed-agg.parquet
fowd_cdip_193p1_filtered-preprocessed-agg.parquet
fowd_cdip_194p1_filtered-preprocessed-agg.parquet
fowd_cdip_195p1_filtered-preprocessed-agg.parquet
fowd_cdip_196p1_filtered-preprocessed-agg.parquet
fowd_cdip_197p1_filtered-preprocessed-agg.parquet
fowd_cdip_198p1_filtered-preprocessed-agg.parquet
fowd_cdip_200p1_filtered-preprocessed-agg.parquet
fowd_cdip_201p1_filtered-preprocessed-agg.parquet
fowd_cdip_202p1_filtered-preprocessed-agg.parquet
fowd_cdip_203p1_filtered-preprocessed-agg.parquet
fowd_cdip_204p1_filtered-preprocessed-agg.parquet
fowd_cdip_207p1_filtered-preprocessed-agg.parquet
fowd_cdip_208p1_filtered-preprocessed-agg.parquet
fowd_cdip_209p1_filtered-preprocessed-agg.parquet
fowd_cdip_210p1_filtered-preprocessed-agg.parquet
fowd_cdip_211p1_filtered-preprocessed-agg.parquet
fowd_cdip_212p1_filtered-preprocessed-agg.parquet
fowd_cdip_213p1_filtered-preprocessed-agg.parquet
fowd_cdip_214p1_filtered-preprocessed-agg.parquet
fowd_cdip_215p1_filtered-preprocessed-agg.parquet
fowd_cdip_216p1_filtered-preprocessed-agg.parquet
fowd_cdip_217p1_filtered-preprocessed-agg.parquet
fowd_cdip_218p1_filtered-preprocessed-agg.parquet
fowd_cdip_219p1_filtered-preprocessed-agg.parquet
fowd_cdip_220p1_filtered-preprocessed-agg.parquet
fowd_cdip_221p1_filtered-preprocessed-agg.parquet
fowd_cdip_222p1_filtered-preprocessed-agg.parquet
fowd_cdip_223p1_filtered-preprocessed-agg.parquet
fowd_cdip_224p1_filtered-preprocessed-agg.parquet
fowd_cdip_225p1_filtered-preprocessed-agg.parquet
fowd_cdip_226p1_filtered-preprocessed-agg.parquet
fowd_cdip_227p1_filtered-preprocessed-agg.parquet
fowd_cdip_228p1_filtered-preprocessed-agg.parquet
fowd_cdip_229p1_filtered-preprocessed-agg.parquet
fowd_cdip_231p1_filtered-preprocessed-agg.parquet
fowd_cdip_232p1_filtered-preprocessed-agg.parquet
fowd_cdip_233p1_filtered-preprocessed-agg.parquet
fowd_cdip_234p1_filtered-preprocessed-agg.parquet
fowd_cdip_235p1_filtered-preprocessed-agg.parquet
fowd_cdip_236p1_filtered-preprocessed-agg.parquet
fowd_cdip_237p1_filtered-preprocessed-agg.parquet
fowd_cdip_238p1_filtered-preprocessed-agg.parquet
fowd_cdip_239p1_filtered-preprocessed-agg.parquet
fowd_cdip_240p1_filtered-preprocessed-agg.parquet
fowd_cdip_241p1_filtered-preprocessed-agg.parquet
fowd_cdip_243p1_filtered-preprocessed-agg.parquet
fowd_cdip_244p1_filtered-preprocessed-agg.parquet
fowd_cdip_245p1_filtered-preprocessed-agg.parquet
fowd_cdip_247p1_filtered-preprocessed-agg.parquet
fowd_cdip_248p1_filtered-preprocessed-agg.parquet
fowd_cdip_252p1_filtered-preprocessed-agg.parquet
fowd_cdip_254p1_filtered-preprocessed-agg.parquet
fowd_cdip_255p1_filtered-preprocessed-agg.parquet
fowd_cdip_256p1_filtered-preprocessed-agg.parquet
fowd_cdip_430p1_filtered-preprocessed-agg.parquet
fowd_cdip_431p1_filtered-preprocessed-agg.parquet
fowd_cdip_432p1_filtered-preprocessed-agg.parquet
fowd_cdip_433p1_filtered-preprocessed-agg.parquet
"

mkdir -p $OUTDIR
cd $OUTDIR

for s in $STATIONS; do
    wget $BASE_URL/$s
done