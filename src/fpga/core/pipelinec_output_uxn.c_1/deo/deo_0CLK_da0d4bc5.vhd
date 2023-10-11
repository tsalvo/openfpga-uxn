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
-- Submodules: 85
entity deo_0CLK_da0d4bc5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_da0d4bc5;
architecture arch of deo_0CLK_da0d4bc5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l527_c6_2990]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c1_3fcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_c136]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l527_c2_505d]
signal n8_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c2_505d]
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l527_c2_505d]
signal t8_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c2_505d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l528_c3_c792[uxn_opcodes_h_l528_c3_c792]
signal printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l532_c11_1586]
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1508]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l532_c7_c136]
signal n8_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l532_c7_c136]
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l532_c7_c136]
signal t8_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_c136]
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l535_c11_5a6a]
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c7_d524]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l535_c7_1508]
signal n8_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l535_c7_1508]
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l535_c7_1508]
signal t8_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1508]
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l539_c11_e4d7]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c7_ae81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c7_d524]
signal n8_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c7_d524]
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l539_c7_d524]
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l542_c11_0887]
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c1_6cde]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l542_c7_ae81]
signal n8_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l542_c7_ae81]
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_ae81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l545_c32_f576]
signal BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l545_c32_8731]
signal BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l545_c32_99ef]
signal MUX_uxn_opcodes_h_l545_c32_99ef_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l545_c32_99ef_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l545_c32_99ef_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l545_c32_99ef_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l549_c42_1241]
signal BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l549_c23_307c]
signal device_out_uxn_opcodes_h_l549_c23_307c_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_307c_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_307c_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_307c_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_307c_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_307c_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_95d5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.device_ram_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;
      base.vram_write_layer := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.vram_value := ref_toks_10;
      base.is_opc_done := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990
BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c2_505d
n8_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c2_505d_cond,
n8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
n8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
n8_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c2_505d
device_out_result_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c2_505d
t8_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c2_505d_cond,
t8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
t8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
t8_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d
result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d
result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

-- printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792
printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792 : entity work.printf_uxn_opcodes_h_l528_c3_c792_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586
BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_left,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_right,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- n8_MUX_uxn_opcodes_h_l532_c7_c136
n8_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l532_c7_c136_cond,
n8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
n8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
n8_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l532_c7_c136
device_out_result_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_cond,
device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- t8_MUX_uxn_opcodes_h_l532_c7_c136
t8_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l532_c7_c136_cond,
t8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
t8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
t8_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136
result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136
result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a
BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_left,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_right,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- n8_MUX_uxn_opcodes_h_l535_c7_1508
n8_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l535_c7_1508_cond,
n8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
n8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
n8_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l535_c7_1508
device_out_result_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_cond,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- t8_MUX_uxn_opcodes_h_l535_c7_1508
t8_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l535_c7_1508_cond,
t8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
t8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
t8_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508
result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7
BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c7_d524
n8_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c7_d524_cond,
n8_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
n8_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
n8_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c7_d524
device_out_result_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524
result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524
result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887
BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_left,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_right,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_return_output);

-- n8_MUX_uxn_opcodes_h_l542_c7_ae81
n8_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
n8_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
n8_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
n8_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81
device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81
result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81
result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l545_c32_f576
BIN_OP_AND_uxn_opcodes_h_l545_c32_f576 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_left,
BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_right,
BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l545_c32_8731
BIN_OP_GT_uxn_opcodes_h_l545_c32_8731 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_left,
BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_right,
BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_return_output);

-- MUX_uxn_opcodes_h_l545_c32_99ef
MUX_uxn_opcodes_h_l545_c32_99ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l545_c32_99ef_cond,
MUX_uxn_opcodes_h_l545_c32_99ef_iftrue,
MUX_uxn_opcodes_h_l545_c32_99ef_iffalse,
MUX_uxn_opcodes_h_l545_c32_99ef_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_left,
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_right,
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_return_output);

-- device_out_uxn_opcodes_h_l549_c23_307c
device_out_uxn_opcodes_h_l549_c23_307c : entity work.device_out_0CLK_8baf3119 port map (
clk,
device_out_uxn_opcodes_h_l549_c23_307c_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l549_c23_307c_device_address,
device_out_uxn_opcodes_h_l549_c23_307c_value,
device_out_uxn_opcodes_h_l549_c23_307c_phase,
device_out_uxn_opcodes_h_l549_c23_307c_previous_device_ram_read,
device_out_uxn_opcodes_h_l549_c23_307c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 n8_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 t8_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 n8_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 t8_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 n8_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 t8_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 n8_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_return_output,
 n8_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_return_output,
 BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_return_output,
 BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_return_output,
 MUX_uxn_opcodes_h_l545_c32_99ef_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_return_output,
 device_out_uxn_opcodes_h_l549_c23_307c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_f59b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_5c37 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_e76e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l540_c3_9c75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l539_c7_d524_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_99ef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_99ef_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_99ef_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_99ef_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_307c_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_307c_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_307c_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_307c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_307c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_c32_7478_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l551_c31_7cb2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l552_c29_9352_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l553_c26_3ca7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_c29_3a3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l555_c25_f336_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l556_c23_2262_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l557_c24_0bc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_DUPLICATE_8312_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l539_l532_l535_l542_DUPLICATE_93fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l522_l560_DUPLICATE_d86d_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l545_c32_99ef_iffalse := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l540_c3_9c75 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l540_c3_9c75;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_5c37 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_5c37;
     VAR_MUX_uxn_opcodes_h_l545_c32_99ef_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_e76e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_e76e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_f59b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_f59b;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_right := to_unsigned(4, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l549_c23_307c_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l549_c23_307c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l549_c23_307c_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2_return_output := result.vram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9_return_output := result.device_ram_address;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l539_l532_l535_l542_DUPLICATE_93fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l539_l532_l535_l542_DUPLICATE_93fc_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c11_e4d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c6_2990] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824_return_output := result.vram_address;

     -- BIN_OP_MINUS[uxn_opcodes_h_l549_c42_1241] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_left;
     BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_return_output := BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l542_c11_0887] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_left;
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output := BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l532_c11_1586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_left;
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output := BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l539_c7_d524_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922_return_output := result.is_device_ram_write;

     -- BIN_OP_AND[uxn_opcodes_h_l545_c32_f576] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_left;
     BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_return_output := BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_DUPLICATE_8312 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_DUPLICATE_8312_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l535_c11_5a6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_left := VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_f576_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_2990_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_1586_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_5a6a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_e4d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_0887_return_output;
     VAR_device_out_uxn_opcodes_h_l549_c23_307c_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_1241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_c159_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_e922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l539_l532_l535_l542_DUPLICATE_93fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l539_l532_l535_l542_DUPLICATE_93fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l539_l532_l535_l542_DUPLICATE_93fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l539_l532_l535_l542_DUPLICATE_93fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_DUPLICATE_8312_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_DUPLICATE_8312_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_DUPLICATE_8312_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_DUPLICATE_8312_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_7568_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a4a1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_67b2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_2824_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_f0e9_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l535_l539_l527_l542_l532_DUPLICATE_a7a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l539_c7_d524_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l545_c32_8731] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_left;
     BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_return_output := BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- t8_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     t8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     t8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_return_output := t8_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- n8_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     n8_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     n8_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := n8_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c1_3fcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l545_c32_99ef_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_8731_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_3fcf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_n8_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_t8_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     -- t8_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     t8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     t8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_return_output := t8_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- n8_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     n8_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_return_output := n8_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- MUX[uxn_opcodes_h_l545_c32_99ef] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l545_c32_99ef_cond <= VAR_MUX_uxn_opcodes_h_l545_c32_99ef_cond;
     MUX_uxn_opcodes_h_l545_c32_99ef_iftrue <= VAR_MUX_uxn_opcodes_h_l545_c32_99ef_iftrue;
     MUX_uxn_opcodes_h_l545_c32_99ef_iffalse <= VAR_MUX_uxn_opcodes_h_l545_c32_99ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l545_c32_99ef_return_output := MUX_uxn_opcodes_h_l545_c32_99ef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- printf_uxn_opcodes_h_l528_c3_c792[uxn_opcodes_h_l528_c3_c792] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l528_c3_c792_uxn_opcodes_h_l528_c3_c792_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue := VAR_MUX_uxn_opcodes_h_l545_c32_99ef_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_n8_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- n8_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     n8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     n8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_return_output := n8_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- t8_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     t8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_return_output := t8_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_n8_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l527_c2_505d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- n8_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     n8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     n8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_return_output := n8_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- n8_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     n8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_return_output := n8_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c1_6cde] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l549_c23_307c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_6cde_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l527_c2_505d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- device_out[uxn_opcodes_h_l549_c23_307c] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l549_c23_307c_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l549_c23_307c_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l549_c23_307c_device_address <= VAR_device_out_uxn_opcodes_h_l549_c23_307c_device_address;
     device_out_uxn_opcodes_h_l549_c23_307c_value <= VAR_device_out_uxn_opcodes_h_l549_c23_307c_value;
     device_out_uxn_opcodes_h_l549_c23_307c_phase <= VAR_device_out_uxn_opcodes_h_l549_c23_307c_phase;
     device_out_uxn_opcodes_h_l549_c23_307c_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l549_c23_307c_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output := device_out_uxn_opcodes_h_l549_c23_307c_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l557_c24_0bc3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l557_c24_0bc3_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.is_deo_done;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l556_c23_2262] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l556_c23_2262_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l553_c26_3ca7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l553_c26_3ca7_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l554_c29_3a3e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_c29_3a3e_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l552_c29_9352] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l552_c29_9352_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.device_ram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l555_c25_f336] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l555_c25_f336_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l551_c31_7cb2] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l551_c31_7cb2_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l550_c32_7478] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_c32_7478_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_307c_return_output.is_device_ram_write;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l557_c24_0bc3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_c32_7478_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l553_c26_3ca7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_c29_3a3e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l556_c23_2262_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l555_c25_f336_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l551_c31_7cb2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l552_c29_9352_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_ae81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_ae81_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_return_output := device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l539_c7_d524] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_d524_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_return_output := device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l535_c7_1508] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_cond;
     result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output := result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1508_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_c136] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_505d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_c136_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c2_505d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l522_l560_DUPLICATE_d86d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l522_l560_DUPLICATE_d86d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_95d5(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_505d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_505d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l522_l560_DUPLICATE_d86d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l522_l560_DUPLICATE_d86d_return_output;
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
