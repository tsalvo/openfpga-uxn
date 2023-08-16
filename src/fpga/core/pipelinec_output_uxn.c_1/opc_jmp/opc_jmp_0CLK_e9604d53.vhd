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
entity opc_jmp_0CLK_e9604d53 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jmp_0CLK_e9604d53;
architecture arch of opc_jmp_0CLK_e9604d53 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l392_c7_6d56]
signal t_register_uxn_opcodes_h_l392_c7_6d56_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l392_c7_6d56_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l392_c7_6d56_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l393_c9_165c]
signal set_uxn_opcodes_h_l393_c9_165c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l393_c9_165c_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l393_c9_165c_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l393_c9_165c_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l393_c9_165c_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l393_c9_165c_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l393_c9_165c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l394_c6_72d5]
signal BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l395_c1_4584]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l394_c2_9ffe]
signal result_MUX_uxn_opcodes_h_l394_c2_9ffe_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l394_c2_9ffe_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l394_c2_9ffe_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output : unsigned(0 downto 0);

-- pc_add_s8[uxn_opcodes_h_l396_c3_ad33]
signal pc_add_s8_uxn_opcodes_h_l396_c3_ad33_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_h_l396_c3_ad33_adjustment : signed(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l392_c7_6d56
t_register_uxn_opcodes_h_l392_c7_6d56 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l392_c7_6d56_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l392_c7_6d56_stack_index,
t_register_uxn_opcodes_h_l392_c7_6d56_return_output);

-- set_uxn_opcodes_h_l393_c9_165c
set_uxn_opcodes_h_l393_c9_165c : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l393_c9_165c_CLOCK_ENABLE,
set_uxn_opcodes_h_l393_c9_165c_stack_index,
set_uxn_opcodes_h_l393_c9_165c_ins,
set_uxn_opcodes_h_l393_c9_165c_k,
set_uxn_opcodes_h_l393_c9_165c_mul,
set_uxn_opcodes_h_l393_c9_165c_add,
set_uxn_opcodes_h_l393_c9_165c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5
BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_left,
BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_right,
BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_return_output);

-- result_MUX_uxn_opcodes_h_l394_c2_9ffe
result_MUX_uxn_opcodes_h_l394_c2_9ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l394_c2_9ffe_cond,
result_MUX_uxn_opcodes_h_l394_c2_9ffe_iftrue,
result_MUX_uxn_opcodes_h_l394_c2_9ffe_iffalse,
result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output);

-- pc_add_s8_uxn_opcodes_h_l396_c3_ad33
pc_add_s8_uxn_opcodes_h_l396_c3_ad33 : entity work.pc_add_s8_0CLK_8573165f port map (
clk,
pc_add_s8_uxn_opcodes_h_l396_c3_ad33_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_h_l396_c3_ad33_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l392_c7_6d56_return_output,
 set_uxn_opcodes_h_l393_c9_165c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_return_output,
 result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l392_c7_6d56_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l392_c7_6d56_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l392_c7_6d56_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l393_c9_165c_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l393_c9_165c_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l393_c9_165c_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l393_c9_165c_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l393_c9_165c_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l393_c9_165c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l393_c9_165c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_cond : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l396_c3_ad33_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l396_c13_e824_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l396_c3_ad33_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l393_c9_165c_add := resize(to_signed(-1, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l393_c9_165c_mul := resize(to_unsigned(1, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l393_c9_165c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l392_c7_6d56_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l393_c9_165c_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l393_c9_165c_k := VAR_k;
     VAR_set_uxn_opcodes_h_l393_c9_165c_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l392_c7_6d56_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l393_c9_165c] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l393_c9_165c_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l393_c9_165c_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l393_c9_165c_stack_index <= VAR_set_uxn_opcodes_h_l393_c9_165c_stack_index;
     set_uxn_opcodes_h_l393_c9_165c_ins <= VAR_set_uxn_opcodes_h_l393_c9_165c_ins;
     set_uxn_opcodes_h_l393_c9_165c_k <= VAR_set_uxn_opcodes_h_l393_c9_165c_k;
     set_uxn_opcodes_h_l393_c9_165c_mul <= VAR_set_uxn_opcodes_h_l393_c9_165c_mul;
     set_uxn_opcodes_h_l393_c9_165c_add <= VAR_set_uxn_opcodes_h_l393_c9_165c_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l393_c9_165c_return_output := set_uxn_opcodes_h_l393_c9_165c_return_output;

     -- t_register[uxn_opcodes_h_l392_c7_6d56] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l392_c7_6d56_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l392_c7_6d56_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l392_c7_6d56_stack_index <= VAR_t_register_uxn_opcodes_h_l392_c7_6d56_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l392_c7_6d56_return_output := t_register_uxn_opcodes_h_l392_c7_6d56_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_left := VAR_set_uxn_opcodes_h_l393_c9_165c_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l393_c9_165c_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l392_c7_6d56_return_output;
     -- CAST_TO_int8_t[uxn_opcodes_h_l396_c13_e824] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l396_c13_e824_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l392_c7_6d56_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l394_c6_72d5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_left;
     BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output := BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l394_c6_72d5_return_output;
     VAR_pc_add_s8_uxn_opcodes_h_l396_c3_ad33_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_h_l396_c13_e824_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l395_c1_4584] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_return_output;

     -- result_MUX[uxn_opcodes_h_l394_c2_9ffe] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l394_c2_9ffe_cond <= VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_cond;
     result_MUX_uxn_opcodes_h_l394_c2_9ffe_iftrue <= VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_iftrue;
     result_MUX_uxn_opcodes_h_l394_c2_9ffe_iffalse <= VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output := result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output;

     -- Submodule level 3
     VAR_pc_add_s8_uxn_opcodes_h_l396_c3_ad33_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l395_c1_4584_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l394_c2_9ffe_return_output;
     -- pc_add_s8[uxn_opcodes_h_l396_c3_ad33] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_h_l396_c3_ad33_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_h_l396_c3_ad33_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_h_l396_c3_ad33_adjustment <= VAR_pc_add_s8_uxn_opcodes_h_l396_c3_ad33_adjustment;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
