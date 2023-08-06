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
-- Submodules: 9
entity opc_jci_0CLK_4c4669f6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jci_0CLK_4c4669f6;
architecture arch of opc_jci_0CLK_4c4669f6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);

-- Each function instance gets signals
-- stack_pointer_move[uxn_opcodes_h_l24_c2_c792]
signal stack_pointer_move_uxn_opcodes_h_l24_c2_c792_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_opcodes_h_l24_c2_c792_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_opcodes_h_l24_c2_c792_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_opcodes_h_l24_c2_c792_is_negative : unsigned(0 downto 0);

-- stack_pointer_get[uxn_opcodes_h_l25_c37_4c1d]
signal stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_return_output : unsigned(7 downto 0);

-- stack_data_get[uxn_opcodes_h_l25_c9_a8af]
signal stack_data_get_uxn_opcodes_h_l25_c9_a8af_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_get_uxn_opcodes_h_l25_c9_a8af_stack_index : unsigned(0 downto 0);
signal stack_data_get_uxn_opcodes_h_l25_c9_a8af_index : unsigned(7 downto 0);
signal stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l26_c11_dfd8]
signal BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l26_c38_0247]
signal pc_get_uxn_opcodes_h_l26_c38_0247_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l26_c38_0247_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l26_c38_c975]
signal BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_return_output : unsigned(16 downto 0);

-- peek2_ram[uxn_opcodes_h_l26_c28_57fe]
signal peek2_ram_uxn_opcodes_h_l26_c28_57fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l26_c28_57fe_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l26_c28_57fe_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l26_c11_f77e]
signal MUX_uxn_opcodes_h_l26_c11_f77e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l26_c11_f77e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l26_c11_f77e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l26_c11_f77e_return_output : unsigned(15 downto 0);

-- pc_add[uxn_opcodes_h_l27_c2_52ad]
signal pc_add_uxn_opcodes_h_l27_c2_52ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l27_c2_52ad_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_move_uxn_opcodes_h_l24_c2_c792
stack_pointer_move_uxn_opcodes_h_l24_c2_c792 : entity work.stack_pointer_move_0CLK_5da82025 port map (
clk,
stack_pointer_move_uxn_opcodes_h_l24_c2_c792_CLOCK_ENABLE,
stack_pointer_move_uxn_opcodes_h_l24_c2_c792_stack_index,
stack_pointer_move_uxn_opcodes_h_l24_c2_c792_adjustment,
stack_pointer_move_uxn_opcodes_h_l24_c2_c792_is_negative);

-- stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d
stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_CLOCK_ENABLE,
stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_stack_index,
stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_return_output);

-- stack_data_get_uxn_opcodes_h_l25_c9_a8af
stack_data_get_uxn_opcodes_h_l25_c9_a8af : entity work.stack_data_get_0CLK_c34ffe29 port map (
clk,
stack_data_get_uxn_opcodes_h_l25_c9_a8af_CLOCK_ENABLE,
stack_data_get_uxn_opcodes_h_l25_c9_a8af_stack_index,
stack_data_get_uxn_opcodes_h_l25_c9_a8af_index,
stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8
BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_left,
BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_right,
BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_return_output);

-- pc_get_uxn_opcodes_h_l26_c38_0247
pc_get_uxn_opcodes_h_l26_c38_0247 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l26_c38_0247_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l26_c38_0247_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975
BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_left,
BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_right,
BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_return_output);

-- peek2_ram_uxn_opcodes_h_l26_c28_57fe
peek2_ram_uxn_opcodes_h_l26_c28_57fe : entity work.peek2_ram_0CLK_ad162598 port map (
clk,
peek2_ram_uxn_opcodes_h_l26_c28_57fe_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l26_c28_57fe_address,
peek2_ram_uxn_opcodes_h_l26_c28_57fe_return_output);

-- MUX_uxn_opcodes_h_l26_c11_f77e
MUX_uxn_opcodes_h_l26_c11_f77e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l26_c11_f77e_cond,
MUX_uxn_opcodes_h_l26_c11_f77e_iftrue,
MUX_uxn_opcodes_h_l26_c11_f77e_iffalse,
MUX_uxn_opcodes_h_l26_c11_f77e_return_output);

-- pc_add_uxn_opcodes_h_l27_c2_52ad
pc_add_uxn_opcodes_h_l27_c2_52ad : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_opcodes_h_l27_c2_52ad_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l27_c2_52ad_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 -- Registers
 tmp8,
 tmp16,
 -- All submodule outputs
 stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_return_output,
 stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_return_output,
 pc_get_uxn_opcodes_h_l26_c38_0247_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_return_output,
 peek2_ram_uxn_opcodes_h_l26_c28_57fe_return_output,
 MUX_uxn_opcodes_h_l26_c11_f77e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_index : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l26_c11_f77e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l26_c11_f77e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l26_c11_f77e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l26_c38_0247_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l26_c38_0247_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_return_output : unsigned(16 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l26_c11_f77e_return_output : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l27_c2_52ad_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l27_c2_52ad_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8 := tmp8;
  REG_VAR_tmp16 := tmp16;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_return_output := to_unsigned(0, 1);
     VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_is_negative := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l26_c11_f77e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_adjustment := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;

     -- Submodule level 0
     VAR_pc_add_uxn_opcodes_h_l27_c2_52ad_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l26_c38_0247_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_stack_index := VAR_stack_index;
     -- stack_pointer_move[uxn_opcodes_h_l24_c2_c792] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_opcodes_h_l24_c2_c792_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_opcodes_h_l24_c2_c792_stack_index <= VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_stack_index;
     stack_pointer_move_uxn_opcodes_h_l24_c2_c792_adjustment <= VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_adjustment;
     stack_pointer_move_uxn_opcodes_h_l24_c2_c792_is_negative <= VAR_stack_pointer_move_uxn_opcodes_h_l24_c2_c792_is_negative;
     -- Outputs

     -- stack_pointer_get[uxn_opcodes_h_l25_c37_4c1d] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_stack_index <= VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_return_output := stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_return_output;

     -- pc_get[uxn_opcodes_h_l26_c38_0247] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l26_c38_0247_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l26_c38_0247_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l26_c38_0247_return_output := pc_get_uxn_opcodes_h_l26_c38_0247_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_left := VAR_pc_get_uxn_opcodes_h_l26_c38_0247_return_output;
     VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_index := VAR_stack_pointer_get_uxn_opcodes_h_l25_c37_4c1d_return_output;
     -- stack_data_get[uxn_opcodes_h_l25_c9_a8af] LATENCY=0
     -- Clock enable
     stack_data_get_uxn_opcodes_h_l25_c9_a8af_CLOCK_ENABLE <= VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_CLOCK_ENABLE;
     -- Inputs
     stack_data_get_uxn_opcodes_h_l25_c9_a8af_stack_index <= VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_stack_index;
     stack_data_get_uxn_opcodes_h_l25_c9_a8af_index <= VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_index;
     -- Outputs
     VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output := stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l26_c38_c975] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_left;
     BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_return_output := BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_return_output;

     -- Submodule level 2
     VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l26_c38_c975_return_output, 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_left := VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output;
     REG_VAR_tmp8 := VAR_stack_data_get_uxn_opcodes_h_l25_c9_a8af_return_output;
     -- peek2_ram[uxn_opcodes_h_l26_c28_57fe] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l26_c28_57fe_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l26_c28_57fe_address <= VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_return_output := peek2_ram_uxn_opcodes_h_l26_c28_57fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l26_c11_dfd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l26_c11_f77e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l26_c11_dfd8_return_output;
     VAR_MUX_uxn_opcodes_h_l26_c11_f77e_iffalse := VAR_peek2_ram_uxn_opcodes_h_l26_c28_57fe_return_output;
     -- MUX[uxn_opcodes_h_l26_c11_f77e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l26_c11_f77e_cond <= VAR_MUX_uxn_opcodes_h_l26_c11_f77e_cond;
     MUX_uxn_opcodes_h_l26_c11_f77e_iftrue <= VAR_MUX_uxn_opcodes_h_l26_c11_f77e_iftrue;
     MUX_uxn_opcodes_h_l26_c11_f77e_iffalse <= VAR_MUX_uxn_opcodes_h_l26_c11_f77e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l26_c11_f77e_return_output := MUX_uxn_opcodes_h_l26_c11_f77e_return_output;

     -- Submodule level 4
     VAR_pc_add_uxn_opcodes_h_l27_c2_52ad_adjustment := VAR_MUX_uxn_opcodes_h_l26_c11_f77e_return_output;
     REG_VAR_tmp16 := VAR_MUX_uxn_opcodes_h_l26_c11_f77e_return_output;
     -- pc_add[uxn_opcodes_h_l27_c2_52ad] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l27_c2_52ad_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l27_c2_52ad_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l27_c2_52ad_adjustment <= VAR_pc_add_uxn_opcodes_h_l27_c2_52ad_adjustment;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8 <= REG_COMB_tmp8;
     tmp16 <= REG_COMB_tmp16;
 end if;
 end if;
end process;

end arch;
