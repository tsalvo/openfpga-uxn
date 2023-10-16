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
-- Submodules: 4
entity device_in_0CLK_5af1a430 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_5af1a430;
architecture arch of device_in_0CLK_5af1a430 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l240_c6_f0e2]
signal BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output : unsigned(0 downto 0);

-- result_is_dei_done_MUX[uxn_device_h_l240_c2_b8c4]
signal result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_cond : unsigned(0 downto 0);
signal result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iftrue : unsigned(0 downto 0);
signal result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iffalse : unsigned(0 downto 0);
signal result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_return_output : unsigned(0 downto 0);

-- result_dei_value_MUX[uxn_device_h_l240_c2_b8c4]
signal result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_cond : unsigned(0 downto 0);
signal result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iftrue : unsigned(7 downto 0);
signal result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iffalse : unsigned(7 downto 0);
signal result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_return_output : unsigned(7 downto 0);

function CONST_REF_RD_device_in_result_t_device_in_result_t_7f6e( ref_toks_0 : device_in_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base := ref_toks_0;
      base.is_dei_done := ref_toks_1;
      base.dei_value := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l240_c6_f0e2
BIN_OP_EQ_uxn_device_h_l240_c6_f0e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_left,
BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_right,
BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output);

-- result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4
result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_cond,
result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iftrue,
result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iffalse,
result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_return_output);

-- result_dei_value_MUX_uxn_device_h_l240_c2_b8c4
result_dei_value_MUX_uxn_device_h_l240_c2_b8c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_cond,
result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iftrue,
result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iffalse,
result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output,
 result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_return_output,
 result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_dei_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_device_h_l240_c2_b8c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_cond : unsigned(0 downto 0);
 variable VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l241_c3_782f : unsigned(7 downto 0);
 variable VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_dei_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_device_h_l240_c2_b8c4_return_output : unsigned(7 downto 0);
 variable VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_return_output : unsigned(7 downto 0);
 variable VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_device_in_result_t_device_in_result_t_7f6e_uxn_device_h_l237_l245_DUPLICATE_6a3e_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_right := to_unsigned(0, 1);
     VAR_result_dei_value_uxn_device_h_l241_c3_782f := resize(to_unsigned(0, 1), 8);
     VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iftrue := VAR_result_dei_value_uxn_device_h_l241_c3_782f;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_left := VAR_phase;
     -- result_dei_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_device_h_l240_c2_b8c4] LATENCY=0
     VAR_result_dei_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_device_h_l240_c2_b8c4_return_output := result.dei_value;

     -- BIN_OP_EQ[uxn_device_h_l240_c6_f0e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_left <= VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_left;
     BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_right <= VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output := BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output;

     -- result_is_dei_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_device_h_l240_c2_b8c4] LATENCY=0
     VAR_result_is_dei_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_device_h_l240_c2_b8c4_return_output := result.is_dei_done;

     -- Submodule level 1
     VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output;
     VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c6_f0e2_return_output;
     VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iffalse := VAR_result_dei_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_device_h_l240_c2_b8c4_return_output;
     VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iffalse := VAR_result_is_dei_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_device_h_l240_c2_b8c4_return_output;
     -- result_dei_value_MUX[uxn_device_h_l240_c2_b8c4] LATENCY=0
     -- Inputs
     result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_cond <= VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_cond;
     result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iftrue <= VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iftrue;
     result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iffalse <= VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_iffalse;
     -- Outputs
     VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_return_output := result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_return_output;

     -- result_is_dei_done_MUX[uxn_device_h_l240_c2_b8c4] LATENCY=0
     -- Inputs
     result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_cond <= VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_cond;
     result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iftrue <= VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iftrue;
     result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iffalse <= VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_iffalse;
     -- Outputs
     VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_return_output := result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_device_in_result_t_device_in_result_t_7f6e_uxn_device_h_l237_l245_DUPLICATE_6a3e LATENCY=0
     VAR_CONST_REF_RD_device_in_result_t_device_in_result_t_7f6e_uxn_device_h_l237_l245_DUPLICATE_6a3e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_7f6e(
     result,
     VAR_result_is_dei_done_MUX_uxn_device_h_l240_c2_b8c4_return_output,
     VAR_result_dei_value_MUX_uxn_device_h_l240_c2_b8c4_return_output);

     -- Submodule level 3
     REG_VAR_result := VAR_CONST_REF_RD_device_in_result_t_device_in_result_t_7f6e_uxn_device_h_l237_l245_DUPLICATE_6a3e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_in_result_t_device_in_result_t_7f6e_uxn_device_h_l237_l245_DUPLICATE_6a3e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
