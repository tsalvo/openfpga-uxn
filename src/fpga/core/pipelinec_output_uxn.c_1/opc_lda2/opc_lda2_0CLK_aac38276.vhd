-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 7
entity opc_lda2_0CLK_aac38276 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lda2_0CLK_aac38276;
architecture arch of opc_lda2_0CLK_aac38276 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l651_c8_bd26]
signal t2_register_uxn_opcodes_h_l651_c8_bd26_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l651_c8_bd26_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l651_c8_bd26_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l652_c9_cd63]
signal set_uxn_opcodes_h_l652_c9_cd63_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l652_c9_cd63_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l652_c9_cd63_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_cd63_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_cd63_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_cd63_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_cd63_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l653_c6_7f22]
signal BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l654_c1_8c00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l653_c2_d3be]
signal result_MUX_uxn_opcodes_h_l653_c2_d3be_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l653_c2_d3be_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l653_c2_d3be_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output : unsigned(0 downto 0);

-- peek2_ram[uxn_opcodes_h_l655_c29_e4f8]
signal peek2_ram_uxn_opcodes_h_l655_c29_e4f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l655_c29_e4f8_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l655_c29_e4f8_return_output : unsigned(15 downto 0);

-- put_stack[uxn_opcodes_h_l655_c3_17c0]
signal put_stack_uxn_opcodes_h_l655_c3_17c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l655_c3_17c0_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l655_c3_17c0_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l655_c3_17c0_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l651_c8_bd26
t2_register_uxn_opcodes_h_l651_c8_bd26 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l651_c8_bd26_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l651_c8_bd26_stack_index,
t2_register_uxn_opcodes_h_l651_c8_bd26_return_output);

-- set_uxn_opcodes_h_l652_c9_cd63
set_uxn_opcodes_h_l652_c9_cd63 : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l652_c9_cd63_CLOCK_ENABLE,
set_uxn_opcodes_h_l652_c9_cd63_stack_index,
set_uxn_opcodes_h_l652_c9_cd63_ins,
set_uxn_opcodes_h_l652_c9_cd63_k,
set_uxn_opcodes_h_l652_c9_cd63_mul,
set_uxn_opcodes_h_l652_c9_cd63_add,
set_uxn_opcodes_h_l652_c9_cd63_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22
BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_left,
BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_right,
BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output);

-- result_MUX_uxn_opcodes_h_l653_c2_d3be
result_MUX_uxn_opcodes_h_l653_c2_d3be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l653_c2_d3be_cond,
result_MUX_uxn_opcodes_h_l653_c2_d3be_iftrue,
result_MUX_uxn_opcodes_h_l653_c2_d3be_iffalse,
result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output);

-- peek2_ram_uxn_opcodes_h_l655_c29_e4f8
peek2_ram_uxn_opcodes_h_l655_c29_e4f8 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l655_c29_e4f8_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l655_c29_e4f8_address,
peek2_ram_uxn_opcodes_h_l655_c29_e4f8_return_output);

-- put_stack_uxn_opcodes_h_l655_c3_17c0
put_stack_uxn_opcodes_h_l655_c3_17c0 : entity work.put_stack_0CLK_e3ba3c7d port map (
clk,
put_stack_uxn_opcodes_h_l655_c3_17c0_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l655_c3_17c0_stack_index,
put_stack_uxn_opcodes_h_l655_c3_17c0_offset,
put_stack_uxn_opcodes_h_l655_c3_17c0_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l651_c8_bd26_return_output,
 set_uxn_opcodes_h_l652_c9_cd63_return_output,
 BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output,
 result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output,
 peek2_ram_uxn_opcodes_h_l655_c29_e4f8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_cd63_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_cd63_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_cd63_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_cd63_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_cd63_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_cd63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_cd63_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_value : unsigned(7 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_return_output : unsigned(15 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l652_c9_cd63_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l652_c9_cd63_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_right := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_offset := resize(to_unsigned(9, 4), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l652_c9_cd63_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l652_c9_cd63_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l652_c9_cd63_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l652_c9_cd63_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l652_c9_cd63] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l652_c9_cd63_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l652_c9_cd63_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l652_c9_cd63_stack_index <= VAR_set_uxn_opcodes_h_l652_c9_cd63_stack_index;
     set_uxn_opcodes_h_l652_c9_cd63_ins <= VAR_set_uxn_opcodes_h_l652_c9_cd63_ins;
     set_uxn_opcodes_h_l652_c9_cd63_k <= VAR_set_uxn_opcodes_h_l652_c9_cd63_k;
     set_uxn_opcodes_h_l652_c9_cd63_mul <= VAR_set_uxn_opcodes_h_l652_c9_cd63_mul;
     set_uxn_opcodes_h_l652_c9_cd63_add <= VAR_set_uxn_opcodes_h_l652_c9_cd63_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l652_c9_cd63_return_output := set_uxn_opcodes_h_l652_c9_cd63_return_output;

     -- t2_register[uxn_opcodes_h_l651_c8_bd26] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l651_c8_bd26_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l651_c8_bd26_stack_index <= VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_return_output := t2_register_uxn_opcodes_h_l651_c8_bd26_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_left := VAR_set_uxn_opcodes_h_l652_c9_cd63_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l652_c9_cd63_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_address := VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l651_c8_bd26_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l653_c6_7f22] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_left;
     BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output := BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output;
     VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_7f22_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l654_c1_8c00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output;

     -- result_MUX[uxn_opcodes_h_l653_c2_d3be] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l653_c2_d3be_cond <= VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_cond;
     result_MUX_uxn_opcodes_h_l653_c2_d3be_iftrue <= VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_iftrue;
     result_MUX_uxn_opcodes_h_l653_c2_d3be_iffalse <= VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output := result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output;

     -- Submodule level 3
     VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output;
     VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_8c00_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l653_c2_d3be_return_output;
     -- peek2_ram[uxn_opcodes_h_l655_c29_e4f8] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l655_c29_e4f8_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l655_c29_e4f8_address <= VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_return_output := peek2_ram_uxn_opcodes_h_l655_c29_e4f8_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_value := resize(VAR_peek2_ram_uxn_opcodes_h_l655_c29_e4f8_return_output, 8);
     -- put_stack[uxn_opcodes_h_l655_c3_17c0] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l655_c3_17c0_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l655_c3_17c0_stack_index <= VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_stack_index;
     put_stack_uxn_opcodes_h_l655_c3_17c0_offset <= VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_offset;
     put_stack_uxn_opcodes_h_l655_c3_17c0_value <= VAR_put_stack_uxn_opcodes_h_l655_c3_17c0_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
