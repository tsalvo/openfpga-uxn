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
-- Submodules: 90
entity deo_0CLK_52d54777 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_52d54777;
architecture arch of deo_0CLK_52d54777 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_db18]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c1_e1a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c7_0811]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l539_c2_e91f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l539_c2_e91f]
signal t8_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c2_e91f]
signal n8_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_e91f]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l540_c3_f7d3[uxn_opcodes_h_l540_c3_f7d3]
signal printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l545_c11_a8f0]
signal BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l545_c7_0811]
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l545_c7_0811]
signal t8_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l545_c7_0811]
signal n8_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l545_c7_0811]
signal device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l548_c11_3da6]
signal BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_c68e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal t8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal n8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l548_c7_ebb0]
signal device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l552_c11_e42f]
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_c68e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l552_c7_c68e]
signal n8_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l552_c7_c68e]
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l555_c11_0ffd]
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_b796]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal n8_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l555_c7_b1ae]
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l559_c32_b43e]
signal BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l559_c32_8586]
signal BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l559_c32_5590]
signal MUX_uxn_opcodes_h_l559_c32_5590_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l559_c32_5590_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c32_5590_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c32_5590_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l563_c42_7166]
signal BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l563_c23_4725]
signal device_out_uxn_opcodes_h_l563_c23_4725_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l563_c23_4725_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l563_c23_4725_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l563_c23_4725_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l563_c23_4725_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l563_c23_4725_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e79( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.device_ram_value := ref_toks_9;
      base.device_ram_address := ref_toks_10;
      base.stack_address_sp_offset := ref_toks_11;
      base.is_opc_done := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18
BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f
result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f
result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f
result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f
result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f
result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f
result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f
result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f
result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_e91f
t8_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
t8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_e91f
n8_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
n8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f
device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

-- printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3
printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3 : entity work.printf_uxn_opcodes_h_l540_c3_f7d3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0
BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_left,
BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_right,
BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811
result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811
result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811
result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811
result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811
result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811
result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811
result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811
result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811
result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811
result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811
result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- t8_MUX_uxn_opcodes_h_l545_c7_0811
t8_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l545_c7_0811_cond,
t8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
t8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
t8_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- n8_MUX_uxn_opcodes_h_l545_c7_0811
n8_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l545_c7_0811_cond,
n8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
n8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
n8_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l545_c7_0811
device_out_result_MUX_uxn_opcodes_h_l545_c7_0811 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_cond,
device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iftrue,
device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iffalse,
device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6
BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_left,
BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_right,
BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0
result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0
result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0
result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0
result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0
result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0
result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0
result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0
result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- t8_MUX_uxn_opcodes_h_l548_c7_ebb0
t8_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
t8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- n8_MUX_uxn_opcodes_h_l548_c7_ebb0
n8_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
n8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0
device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_cond,
device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f
BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_left,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_right,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e
result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e
result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- n8_MUX_uxn_opcodes_h_l552_c7_c68e
n8_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
n8_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
n8_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
n8_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e
device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_cond,
device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd
BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_left,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_right,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae
result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae
result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae
result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae
result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae
result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae
result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- n8_MUX_uxn_opcodes_h_l555_c7_b1ae
n8_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
n8_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae
device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_cond,
device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue,
device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse,
device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e
BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_left,
BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_right,
BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l559_c32_8586
BIN_OP_GT_uxn_opcodes_h_l559_c32_8586 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_left,
BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_right,
BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_return_output);

-- MUX_uxn_opcodes_h_l559_c32_5590
MUX_uxn_opcodes_h_l559_c32_5590 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l559_c32_5590_cond,
MUX_uxn_opcodes_h_l559_c32_5590_iftrue,
MUX_uxn_opcodes_h_l559_c32_5590_iffalse,
MUX_uxn_opcodes_h_l559_c32_5590_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166
BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_left,
BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_right,
BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_return_output);

-- device_out_uxn_opcodes_h_l563_c23_4725
device_out_uxn_opcodes_h_l563_c23_4725 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l563_c23_4725_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l563_c23_4725_device_address,
device_out_uxn_opcodes_h_l563_c23_4725_value,
device_out_uxn_opcodes_h_l563_c23_4725_phase,
device_out_uxn_opcodes_h_l563_c23_4725_previous_device_ram_read,
device_out_uxn_opcodes_h_l563_c23_4725_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 t8_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 n8_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 t8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 n8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 n8_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 n8_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output,
 BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_return_output,
 MUX_uxn_opcodes_h_l559_c32_5590_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_return_output,
 device_out_uxn_opcodes_h_l563_c23_4725_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l542_c3_1d9e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l546_c3_96bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_9739 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l553_c3_1547 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l552_c7_c68e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c32_5590_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c32_5590_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c32_5590_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c32_5590_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l563_c23_4725_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l563_c23_4725_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l563_c23_4725_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l563_c23_4725_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l563_c23_4725_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_c32_f117_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_c31_2e5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l566_c31_fe9d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l567_c29_0cba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l568_c26_713e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l569_c25_a0ec_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l570_c23_2d4a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l571_c24_f922_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l545_l539_l548_l552_DUPLICATE_8591_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_2190_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_19f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l534_l574_DUPLICATE_2632_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_9739 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_9739;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l559_c32_5590_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l546_c3_96bb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l546_c3_96bb;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l559_c32_5590_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l553_c3_1547 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l553_c3_1547;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l542_c3_1d9e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l542_c3_1d9e;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l563_c23_4725_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l563_c23_4725_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l563_c23_4725_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l559_c32_b43e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_left;
     BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_return_output := BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l548_c11_3da6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_left;
     BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output := BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l552_c11_e42f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_left;
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output := BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_19f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_19f5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l545_c11_a8f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_2190 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_2190_return_output := result.is_stack_read;

     -- BIN_OP_MINUS[uxn_opcodes_h_l563_c42_7166] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_left;
     BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_return_output := BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_db18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a_return_output := result.is_device_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l552_c7_c68e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l545_l539_l548_l552_DUPLICATE_8591 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l545_l539_l548_l552_DUPLICATE_8591_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d_return_output := result.vram_address;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798_return_output := result.device_ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l555_c11_0ffd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_left;
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output := BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_left := VAR_BIN_OP_AND_uxn_opcodes_h_l559_c32_b43e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_db18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l545_c11_a8f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_3da6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_e42f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_0ffd_return_output;
     VAR_device_out_uxn_opcodes_h_l563_c23_4725_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l563_c42_7166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5ea2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_7475_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_bb1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_19f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_19f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_19f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_19f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l545_l539_l548_l552_DUPLICATE_8591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l545_l539_l548_l552_DUPLICATE_8591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l545_l539_l548_l552_DUPLICATE_8591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l545_l539_l548_l552_DUPLICATE_8591_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_2190_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_2190_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_2190_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l545_l555_l548_l552_DUPLICATE_2190_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_1a93_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_ae7a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_5f5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_e4c9_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l548_l552_l545_l555_DUPLICATE_6798_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l552_c7_c68e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- t8_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := t8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- n8_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := n8_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l559_c32_8586] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_left;
     BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_return_output := BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c1_e1a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l559_c32_5590_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l559_c32_8586_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_e1a9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_t8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- MUX[uxn_opcodes_h_l559_c32_5590] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l559_c32_5590_cond <= VAR_MUX_uxn_opcodes_h_l559_c32_5590_cond;
     MUX_uxn_opcodes_h_l559_c32_5590_iftrue <= VAR_MUX_uxn_opcodes_h_l559_c32_5590_iftrue;
     MUX_uxn_opcodes_h_l559_c32_5590_iffalse <= VAR_MUX_uxn_opcodes_h_l559_c32_5590_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l559_c32_5590_return_output := MUX_uxn_opcodes_h_l559_c32_5590_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- n8_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     n8_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     n8_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := n8_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- t8_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     t8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     t8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_return_output := t8_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- printf_uxn_opcodes_h_l540_c3_f7d3[uxn_opcodes_h_l540_c3_f7d3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l540_c3_f7d3_uxn_opcodes_h_l540_c3_f7d3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue := VAR_MUX_uxn_opcodes_h_l559_c32_5590_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := t8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- n8_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := n8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_n8_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- n8_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     n8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     n8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_return_output := n8_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_b796] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- n8_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := n8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l563_c23_4725_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_b796_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- device_out[uxn_opcodes_h_l563_c23_4725] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l563_c23_4725_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l563_c23_4725_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l563_c23_4725_device_address <= VAR_device_out_uxn_opcodes_h_l563_c23_4725_device_address;
     device_out_uxn_opcodes_h_l563_c23_4725_value <= VAR_device_out_uxn_opcodes_h_l563_c23_4725_value;
     device_out_uxn_opcodes_h_l563_c23_4725_phase <= VAR_device_out_uxn_opcodes_h_l563_c23_4725_phase;
     device_out_uxn_opcodes_h_l563_c23_4725_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l563_c23_4725_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output := device_out_uxn_opcodes_h_l563_c23_4725_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l567_c29_0cba] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l567_c29_0cba_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l568_c26_713e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l568_c26_713e_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l566_c31_fe9d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l566_c31_fe9d_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l571_c24_f922] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l571_c24_f922_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.is_deo_done;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l570_c23_2d4a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l570_c23_2d4a_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l565_c31_2e5a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_c31_2e5a_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l569_c25_a0ec] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l569_c25_a0ec_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.vram_address;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l564_c32_f117] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_c32_f117_return_output := VAR_device_out_uxn_opcodes_h_l563_c23_4725_return_output.is_device_ram_write;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l571_c24_f922_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_c31_2e5a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_c32_f117_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l568_c26_713e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l570_c23_2d4a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l569_c25_a0ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l566_c31_fe9d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l567_c29_0cba_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_b1ae] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l555_c7_b1ae_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_c68e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_c68e_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_return_output := device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l548_c7_ebb0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l548_c7_ebb0_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l545_c7_0811] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l545_c7_0811_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l539_c2_e91f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l534_l574_DUPLICATE_2632 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l534_l574_DUPLICATE_2632_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e79(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c2_e91f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c2_e91f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l534_l574_DUPLICATE_2632_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l534_l574_DUPLICATE_2632_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
